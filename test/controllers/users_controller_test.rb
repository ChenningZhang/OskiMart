require 'test_helper'

class UsersControllerTest < ActionController::TestCase

  # include Devise::TestHelpers

  # def setup
  #   @user = User.new(first_name: 'Test', last_name: 'Example', email: 'test@example.com',
  #       password: '12345678', password_confirmation: '12345678')
  #   @user.save
  #   allow(request.env['warden']).to receive(:authenticate!).and_return(user)
  #   allow(controller).to receive(:current_user).and_return(user)
  #   sign_in @user
  # end

  # test "should show user" do
  #   get :show, id: @user.id
  #   assert_redirected_to @user
  # end

  # test "should create new user" do
  #   post :create, user: { first_name: 'Test', 
  #                         last_name: 'Controller', 
  #                         email: 'test.controller@berkeley.edu', 
  #                         password: '12345678', 
  #                         password_confirmation: '12345678' }
  #   assert_redirected_to posts_path
  # end

end
