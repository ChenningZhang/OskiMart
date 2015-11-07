require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
	test "signup should fail" do
		#Number of users should not increase, render users/new
		get signup_path
		assert_no_difference 'User.count' do
			post users_path, user: { name: "  ",
									email: "user@example.com",
									username: "User name",
									password: "123",
									password_confirmation: "456" }
		end
		assert_template 'users/new'
	end

	test "signup should succeed" do
		# Number of users increase by 1, redirect to posts
		get signup_path
		assert_difference 'User.count',1 do
			post users_path, user: { name: "Bob Alice",
									email: "bob.alice@berkeley.edu",
									username: "Bob.Alice",
									password: "123",
									password_confirmation: "123" }
		end
		assert_redirected_to posts_path
		assert is_logged_in?
	end
end
