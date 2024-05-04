class GraphqlController < ApplicationController
  # If accessing from outside this domain, nullify the session
  # This allows for outside API access while preventing CSRF attacks,
  # but you'll have to authenticate your user separately
  # protect_from_forgery with: :null_session

  def execute
    variables = prepare_variables(params[:variables])
    query = params[:query]
    operation_name = params[:operationName]
    context = {
      current_user: current_user,
      current_tenant: current_tenant
    }
    result = ServerSchema.execute(query, variables: variables, context: context, operation_name: operation_name)
    render json: result
  rescue StandardError => e
    raise e unless Rails.env.development?
    handle_error_in_development(e)
  end

  private

  # Handle variables in form data, JSON body, or a blank value
  def prepare_variables(variables_param)
    case variables_param
    when String
      if variables_param.present?
        JSON.parse(variables_param) || {}
      else
        {}
      end
    when Hash
      variables_param
    when ActionController::Parameters
      variables_param.to_unsafe_hash # GraphQL-Ruby will validate name and type of incoming variables.
    when nil
      {}
    else
      raise ArgumentError, "Unexpected parameter: #{variables_param}"
    end
  end

  def handle_error_in_development(e)
    logger.error e.message
    logger.error e.backtrace.join("\n")

    render json: { errors: [{ message: e.message, backtrace: e.backtrace }], data: {} }, status: 500
  end

  def current_user
    return nil if request.headers['Authorization'].blank?
    token = request.headers['Authorization']
    if token.blank?
      return nil
    else
      tenant = current_tenant
      firebase_verifier = Firebase::VerifierService.new(tenant.firebase_project_id)
      decoded_token = firebase_verifier.decode(token)
      user_id = decoded_token["user_id"]
      user = User.find_by(
        firebase_user_id: user_id,
        tenant_id: tenant.id
      )
      if user.nil?
        user = User.create!(
          firebase_user_id: user_id,
          tenant_id: tenant.id
        )
      end
      user
    end
  end

  def current_tenant
    return nil if request.headers['X-tenant-api-key'].blank?
    api_key = request.headers['X-tenant-api-key']
    tenant = Tenant.find_by(api_key: api_key)
    return nil unless tenant
    request_domain = URI.parse(request.original_url).host
    allowed_domains = tenant.allowed_domains || []
    allowed_domains = ["localhost"] if Rails.env.development? || Rails.env.test?
    allowed_domain = allowed_domains.find { |domain| request_domain.end_with?(domain) }
    allowed_domain ? tenant : nil
  end
end
