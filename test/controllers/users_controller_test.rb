require 'test_helper'

class UsersControllerTest < ActionController::TestCase


   include Devise::TestHelpers

   def setup
     @request.env["devise.mapping"] = Devise.mappings[:user]
     @user = User.new(:first_name => 'test_first_name',
                      :last_name => 'test_last_name',
                      :email => 'test@berkeley.edu',
                      :password => 'test_password',
                      :password_confirmation => 'test_password'
     )
     @user.save
     sign_in @user
   end

   test "should show user" do
     get :show, id: @user.id
     assert_response :success
   end
  #we don't need to test creation because devise does it for us
   # test "should create new user" do
   #   post :create, user: { first_name: 'Test',
   #                         last_name: 'Controller',
   #                         email: 'test.controller@berkeley.edu',
   #                         password: '12345678',
   #                         password_confirmation: '12345678' }
   #   assert_redirected_to posts_path
   # end
   #
   # test "another new user" do
   #   post :create, first_name: 'Test',
   #                         last_name: 'Controller',
   #                         email: 'test.controller@berkeley.edu',
   #                         password: '12345678',
   #                         password_confirmation: '12345678'
   #   assert_redirected_to posts_path
   # end



  # called after every single test
  def teardown
    @user = nil
  end

end
