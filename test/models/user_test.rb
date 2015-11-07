require 'test_helper'

class UserTest < ActiveSupport::TestCase
	def setup
		@user = User.new(name: "Example User", email: "user@berkeley.edu", username: "User Name", 
			password: "123", password_confirmation: "123")
	end

	test "should be valid" do
		assert @user.valid?
	end

	test "name should be present" do
		@user.name = "  "
		assert_not @user.valid?
	end

	test "email should be present" do
		@user.email = "  "
		assert_not @user.valid?
	end

	test "userName should be present" do
		@user.username = "  "
		assert_not @user.valid?
	end

	test "password should be present" do
		@user.password = @user.password_confirmation = "   "
		assert_not @user.valid?
	end

	test "should be valid email addresses" do
		valid_addresses = %w[user@berkeley.edu USER@berkeley.edu USER@BERKELEY.EDU u_ser@berkeley.edu 
			user.name@berkeley.edu user+name@berkeley.edu]
		valid_addresses.each do |valid_address|
			@user.email = valid_address
			assert @user.valid?, "#{valid_address.inspect} should be valid"
		end
	end

	test "should be invalid email addresses" do
		invalid_addresses = %w[user@example.com user@example.edu user@berkeley.com user@berkeley,edu 
			user.berkeley.edu user_berkeley.edu user@berkeley@edu]
		invalid_addresses.each do |invalid_address|
			@user.email = invalid_address
			assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
		end
	end

	test "email addresses should be unique" do
		duplicate_user = @user.dup
		@user.save
		assert_not duplicate_user.valid?
	end

	test "email addresses should be unique case insensitive" do
		duplicate_user = @user.dup
		duplicate_user.email = @user.email.upcase
		@user.save
		assert_not duplicate_user.valid?
	end

	test "email addresses should be saved as lower-case" do
		mixed_case_email = "Student@BeRkElEy.EDU"
		@user.email = mixed_case_email
		@user.save
		assert_equal mixed_case_email.downcase, @user.reload.email
	end

end
