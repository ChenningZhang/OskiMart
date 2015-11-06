require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
	test "invalid signup does not increase User count" do
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

	test "valid signup increases User count by 1" do
		# TODO
	end
end
