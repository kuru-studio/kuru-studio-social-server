# test/models/user_test.rb

require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "user is valid with a name, email, and password" do
    user = User.new(name: "Naruto Uzumaki", email: "naruto@example.com", password: "password")
    assert user.valid?
  end

  test "user is invalid without a name" do
    user = User.new(email: "sasuke@example.com", password: "password")
    assert_not user.valid?
  end

  test "user is invalid without an email" do
    user = User.new(name: "Sasuke Uchiha", password: "password")
    assert_not user.valid?
  end

  test "user is invalid with a duplicate email" do
    User.create(name: "Sakura Haruno", email: "sakura@example.com", password: "password")
    user = User.new(name: "Hinata Hyuga", email: "sakura@example.com", password: "password")
    assert_not user.valid?
  end

  test "user is valid with a password" do
    user = User.new(name: "Luffy Monkey D.", email: "luffy@example.com", password: "password")
    assert user.valid?
  end

  test "destroys associated posts when destroyed" do
    user = User.create(name: "Goku Son", email: "goku@example.com", password: "password")
    post = user.posts.create(content: "Dragon Ball Z")
    assert_difference('Post.count', -1) do
      user.destroy
    end
  end
end
