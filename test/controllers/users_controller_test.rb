require 'test_helper'

class UsersControllerTest < ActionController::TestCase

  include Devise::TestHelpers

  #test "should get new" do
  ##  get :new
   # assert_response :success
  #end

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
    puts 'lol'
    puts @user.id
    puts 'lol'
    get :show, id: @user.id

    assert_response :success
  end

  # called after every single test
  def teardown
    @user = nil
  end

end
