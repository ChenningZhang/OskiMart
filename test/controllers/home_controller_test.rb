require 'test_helper'

class HomeControllerTest < ActionController::TestCase
    include Devise::TestHelpers

    def setup
      @user = User.new(first_name: 'Test', last_name: 'Example', email: 'test@example.com',
        password: '12345678', password_confirmation: '12345678')
      @user.save
      sign_in @user
    end

   test "should get home" do
     get :home
     assert_response :success
   end

   test "should get login" do
     get :login
     assert_response :success
   end

   test "should get signup" do
     get :signup
     assert_response :success
   end

end
