require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
	# get login_path, assert_template, do login and assert_template
	#setup method signup a user, teardown method destroys it
	# def setup
	# 	post users_path, user: { first_name: "Bob",
 #                  last_name: "Alice",
 #                  email: "bob.alice@berkeley.edu",
 #                  password: "12345678",
 #                  password_confirmation: "12345678" }
 #      	@user = User.find_by(first_name: "Bob")
	# end

	# test "login should fail" do
	# 	get login_path
	# 	assert_template 'sessions/new'
	# end

	# test "login should succeed" do
	# end
end
