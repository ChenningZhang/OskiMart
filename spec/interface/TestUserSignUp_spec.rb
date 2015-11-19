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

	it 'rejects user with non-Berkeley email'
end