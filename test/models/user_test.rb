require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "user must have an email" do
    user = User.new(email: nil, encrypted_password: 0123456)
    assert_not user.save
  end

  test "user email must have a valid email format" do
    user = User.new(email: "email", encrypted_password: 0123456)
    assert_not user.save
  end
  
  test "user email must be unique" do
    existing = users(:one)
    user = User.new(email: existing.email, encrypted_password: 0123456)
    assert_not user.save
  end

  test "user must have a password" do 
    user = User.new(email: "email@email.com", encrypted_password: nil)
    assert_not user.save
  end

  test "user password has a minimum of 6 characters" do
    user = User.new(email: "email@email.com", encrypted_password: "one")
    assert_not user.save
  end
end
