require 'test_helper'

class UserSignupTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  setup do
    # totally new user
    @user = User.new(username:'adam', email:'adam@adam.com', password:'password')
  end

  test "normal user can sign up successfully" do
    assert_difference 'User.count', 1 do
      sign_up_as(@user,@user.password)
    end
    follow_redirect!
    assert_select "#flash_success", "Welcome to Alpha blog! #{@user.username.capitalize}!"
    assert_template 'users/show'
  end
end
