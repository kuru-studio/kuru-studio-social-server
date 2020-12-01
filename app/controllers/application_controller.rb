class ApplicationController < ActionController::API
  def authenticate_user!
    verifier = FirebaseVerifier.new("kuru-studio-social-firebase")

    valid_public_keys = FirebaseVerifier.retrieve_and_cache_jwt_valid_public_keys
    kid = valid_public_keys.keys[0]
    rsa_public = OpenSSL::X509::Certificate.new(valid_public_keys[kid]).public_key

    decoded_token = verifier.decode(http_auth_header, rsa_public)
  end

  private
    def http_auth_header
      if request.headers['Authorization'].present?
        return request.headers['Authorization'].split(' ').last
      else
        render json: { :error => "Missing Authentication Token" }
      end
    end
end
