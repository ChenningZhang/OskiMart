require 'test_helper'

class UsersControllerTest < ActionController::TestCase

  # called before every single test
  def setup
    @user = users(:one)
  end
 
  # called after every single test
  def teardown
    @user = nil
  end
 
  test "should show user" do
    get :show, id: @user.id
    assert_response :success
  end

end
