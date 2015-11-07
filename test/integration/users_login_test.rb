require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
	# get login_path, assert_template, do login and assert_template
	#setup method signup a user, teardown method destroys it
	def setup
		post users_path, user: { name: "Bob Alice",
									email: "bob.alice@berkeley.edu",
									username: "Bob.Alice",
									password: "123",
									password_confirmation: "123" }
		@user = User.find_by(name: "Bob Alice")
	end

	test "login should fail" do
		get login_path
		assert_template 'sessions/new'
	end

	test "login should succeed" do
	end
end
