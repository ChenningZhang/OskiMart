require 'rails_helper'
require 'selenium-webdriver'

RSpec.describe 'User sign up', :type => :feature do
	it 'lets user to sign up with valid inputs', :js => true do
		visit @homepage_url
		click_on 'Sign up'
		fill_in 'First name', :with => 'Chenning'
		fill_in 'Last name', :with => 'Zhang'
		fill_in 'Email', :with => 'czhang1306@berkeley.edu'
		fill_in 'Password', :with => '12345678'
		fill_in 'Confirm Password', :with => '12345678'
		click_on 'Create Account'
		expect(page).to have_title "Newsfeed Page"
	end

	it 'rejects user with non-Berkeley email', :js => true do
		visit @homepage_url
		click_on 'Sign up'
		fill_in 'First name', :with => 'Chenning'
		fill_in 'Last name', :with => 'Zhang'
		fill_in 'Email', :with => 'invalid@gmail.com'
		fill_in 'Password', :with => '12345678'
		fill_in 'Confirm Password', :with => '12345678'
		click_on 'Create Account'
		expect(page).to have_content "Oops, something went wrong while creating a new user."
		expect(page).to have_content "Email must be Berkeley email!"
		expect(page).to have_title "Sign up"
	end

	it 'rejects user with empty signup fields', :js => true do
		visit @homepage_url
		click_on 'Sign up'
		fill_in 'First name', :with => '  '
		fill_in 'Last name', :with => '  '
		fill_in 'Email', :with => 'czhang1306@berkeley.edu'
		fill_in 'Password', :with => '  '
		fill_in 'Confirm Password', :with => '  '
		click_on 'Create Account'
		expect(page).to have_content "Oops, something went wrong while creating a new user."
		expect(page).to have_content "First name can't be blank"
		expect(page).to have_content "Last name can't be blank"
		expect(page).to have_content "Password can't be blank"
		expect(page).to have_title "Sign up"
	end

	it 'rejects user when the password entered is too short', :js => true do
		visit @homepage_url
		click_on 'Sign up'
		fill_in 'First name', :with => 'Chenning'
		fill_in 'Last name', :with => 'Zhang'
		fill_in 'Email', :with => 'czhang1306@berkeley.edu'
		fill_in 'Password', :with => 'short'
		fill_in 'Confirm Password', :with => 'short'
		click_on 'Create Account'
		expect(page).to have_content "Oops, something went wrong while creating a new user."
		expect(page).to have_content "Password is too short (minimum is 8 characters)"
		expect(page).to have_title "Sign up"
	end

	it 'rejects user when password and password_confirmation do not match', :js => true do
		visit @homepage_url
		click_on 'Sign up'
		fill_in 'First name', :with => 'Chenning'
		fill_in 'Last name', :with => 'Zhang'
		fill_in 'Email', :with => 'czhang1306@berkeley.edu'
		fill_in 'Password', :with => '12345678'
		fill_in 'Confirm Password', :with => '87654321'
		click_on 'Create Account'
		expect(page).to have_content "Oops, something went wrong while creating a new user."
		expect(page).to have_content "Password confirmation doesn't match Password"
		expect(page).to have_title "Sign up"
	end
end