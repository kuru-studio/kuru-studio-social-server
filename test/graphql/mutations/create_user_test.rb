require 'test_helper'

class Mutations::CreateUserTest < ActiveSupport::TestCase
  def perform(name: nil, auth_provider: nil)
    Mutations::User::Create.new(object: nil, field: nil, context: {}).resolve(
      name: name,
      auth_provider: auth_provider
    )
  end

  test 'create a new user' do
    user_name = "sunraku"
    user_auth_provider = { credentials: { email: "rakuro.hizutome@gmail.jp", password: "1234" } }

    user = perform(
      name: user_name,
      auth_provider: user_auth_provider
    )

    assert user.persisted?
    assert_equal user.name, user_name
    assert_equal user.email, user_auth_provider[:credentials][:email]
  end
end
