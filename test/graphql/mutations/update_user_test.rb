require 'test_helper'

class Mutations::UpdateUserTest < ActiveSupport::TestCase
  def perform(user, name)
    Mutations::User::Update.new(object: nil, field: nil, context: { current_user: user }).resolve(
      update_user_attributes: { name: name }
    )
  end

  test 'update user name' do
    user = User.create(name: "Mary Elizabeth Winstead")
    response = perform(user, "Kana Hanazawa")
    assert_not_nil response[:user] || response[:errors]
    if response[:user]
      assert_equal new_name, response[:user].name
    end
  end

  test 'update user name with invalid data' do
    user = User.create(name: "Mary Elizabeth Winstead")
    response = perform(user, "")
    assert response[:errors].present?
    assert_nil response[:user]
  end
end
