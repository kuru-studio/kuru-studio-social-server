class TestBlogsController < ApplicationController
  before_action :http_auth_header, only: [:index]

  # GET /test_blogs
  def index
    verifier = FirebaseVerifier.new("kuru-studio-social-firebase-dv")

    rsa_private = OpenSSL::PKey::RSA.generate 2048
    rsa_public = rsa_private.public_key

    decoded_token = verifier.decode(http_auth_header, rsa_public)

    @firebase_data = {
      :payoad => decoded_token[0],
      :headers => decoded_token[1]
    }

    render json: @firebase_data
  end

  private
    def http_auth_header
      if request.headers['Authorization'].present?
        return request.headers['Authorization'].split(' ').last
      else
        render json: { :error => "Missing Token" }
      end
    end
end
