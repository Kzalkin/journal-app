require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  setup do
    @user = users(:one)
  end
  
  test "sign in" do
    sign_in @user
    visit categories_path
    assert_text @user.email
  end

  test "sign up" do
    visit root_path
    assert_text "Sign in"
    visit new_user_registration_path
    assert_text "Sign up"

    fill_in "Email", with: "something@email.com"
    fill_in "Password (6 characters minimum)", with: 1234567890
    fill_in "Password confirmation", with: 1234567890

    click_on "Sign up"
    assert_text "Tasks Today"
  end
end
