require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  def setup
    @user = User.new(:first_name => 'test_first_name',
                     :last_name => 'test_last_name',
                     :email => 'test@berkeley.edu',
                     :password => 'test_password',
                     :password_confirmation => 'test_password'
    )
    @user.save
  end

  test "should sign in user" do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    post :create, email: 'test@berkeley.edu', password: 'test_password'
    assert_response :success
  end



end
