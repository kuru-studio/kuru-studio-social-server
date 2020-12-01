class FirebaseVerifier
  prepend SimpleCommand

  VALID_JWT_PUBLIC_KEYS_RESPONSE_CACHE_KEY = "firebase_jwt_public_keys_cache_key"
  JWT_ALGORITHM = 'RS256'

  def initialize(firebase_project_id)
    @firebase_project_id = firebase_project_id
  end

  def decode(id_token, public_key)
    decoded_token, error = FirebaseVerifier.decode_jwt_token(id_token, @firebase_project_id, nil)
    unless error.nil?
      raise error
    end
    payload = decoded_token[0]
    headers = decoded_token[1]
    alg = headers['alg']
    if alg != JWT_ALGORITHM
      raise "Invalid access token 'alg' header (#{alg}). Must be '#{JWT_ALGORITHM}'."
    end
    valid_public_keys = FirebaseVerifier.retrieve_and_cache_jwt_valid_public_keys
    kid = headers['kid']
    unless valid_public_keys.keys.include?(kid)
      raise "Invalid access token 'kid' header, do not correspond to valid public keys."
    end
    sub = payload['sub']
    if sub.nil? || sub.empty?
      raise "Invalid access token. 'Subject' (sub) must be a non-empty string."
    end
    decoded_token, error = FirebaseVerifier.decode_jwt_token(id_token, @firebase_project_id, public_key)
    if decoded_token.nil?
      raise error
    end
    decoded_token
  end

  def self.decode_jwt_token(firebase_jwt_token, firebase_project_id, public_key)
    custom_options = {:verify_iat => true,
      :verify_aud => true, :aud => firebase_project_id,
      :verify_iss => true, :iss => "https://securetoken.google.com/"+firebase_project_id }
    unless public_key.nil?
      custom_options[:algorithm] = JWT_ALGORITHM
    end
    begin
      decoded_token = JWT.decode(firebase_jwt_token, public_key, !public_key.nil?, custom_options)
    rescue JWT::ExpiredSignature
      return nil, "Invalid access token. 'Expiration time' (exp) must be in the future."
    rescue JWT::InvalidIatError
      return nil, "Invalid access token. 'Issued-at time' (iat) must be in the past."
    rescue JWT::InvalidAudError
      return nil, "Invalid access token. 'Audience' (aud) must be your Firebase project ID, the unique identifier for your Firebase project."
    rescue JWT::InvalidIssuerError
      return nil, "Invalid access token. 'Issuer' (iss) Must be 'https://securetoken.google.com/<projectId>', where <projectId> is your Firebase project ID."
    rescue JWT::VerificationError
      return nil, "Invalid access token. Signature verification failed."
    end
    return decoded_token, nil
  end

  def self.retrieve_and_cache_jwt_valid_public_keys
    valid_public_keys = Rails.cache.read(VALID_JWT_PUBLIC_KEYS_RESPONSE_CACHE_KEY)
    if valid_public_keys.nil?
      uri = URI("https://www.googleapis.com/robot/v1/metadata/x509/securetoken@system.gserviceaccount.com")
      https = Net::HTTP.new(uri.host, uri.port)
      https.use_ssl = true
      req = Net::HTTP::Get.new(uri.path)
      response = https.request(req)
      if response.code != '200'
        raise "Something went wrong: can't obtain valid JWT public keys from Google."
      end
      valid_public_keys = JSON.parse(response.body)

      cc = response["cache-control"]
      max_age = cc[/max-age=(\d+?),/m, 1]

      Rails.cache.write(VALID_JWT_PUBLIC_KEYS_RESPONSE_CACHE_KEY, valid_public_keys, :expires_in => max_age.to_i)
    end
    valid_public_keys
  end
end
