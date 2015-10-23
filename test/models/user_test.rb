require 'test_helper'

class UserTest < ActiveSupport::TestCase
	test "should load 1 user" do
	  assert_equal(1, User.count, "Didn't load 1 user")
	end 
	
	test "id should be 1" do
	  assert_equal('Bob', User.find(1).name, "User is wrong")
	end 

end
