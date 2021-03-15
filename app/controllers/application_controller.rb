class ApplicationController < ActionController::API
  def authenticate_user!
    @current_user = user_authenticator
  end

  def user_signed_in?
    return false if @current_user.nil?
    true
  end

  def current_user
    @current_user
  end

  private
    def http_auth_header
      if request.headers['Authorization'].present?
        return request.headers['Authorization'].split(' ').last
      else
        render json: { :error => "Missing Authentication Token" }
      end
    end

    def user_authenticator
      verifier = FirebaseVerifier.new(Rails.application.credentials.send(Rails.env)[:database][:firebase_project_id])

      valid_public_keys = FirebaseVerifier.retrieve_and_cache_jwt_valid_public_keys
      kid = valid_public_keys.keys[0]
      rsa_public = OpenSSL::X509::Certificate.new(valid_public_keys[kid]).public_key

      decoded_token = verifier.decode(http_auth_header, rsa_public)
      firebase_login(decoded_token[0]["user_id"])
    end

    def firebase_login(user_id)
      current_user = User.find_by_firebase_user_id(user_id)
      if current_user.nil?
        current_user = User.new
        current_user.firebase_user_id = user_id
        current_user.save
      end
      current_user
    end
end
