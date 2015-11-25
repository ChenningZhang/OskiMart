require 'rails_helper'
require 'selenium-webdriver'

RSpec.describe 'User login', :type => :feature do
	# Memo: Need to test with and without remember_me

	before(:each) do
		FactoryGirl.create(:user)
	end

	it 'lets user to log in with correct credentials(without remember_me)', :js => true do
		visit @homepage_url
		click_on 'Log in'
		fill_in 'Email', :with => 'czhang1306@berkeley.edu'
		fill_in 'Password', :with => '12345678'
		click_on 'Sign In'
		expect(page).to have_title "Newsfeed"
	end

	it 'does not let user to log in with incorrect credentials', :js => true do
		visit @homepage_url
		click_on 'Log in'
		fill_in 'Email', :with => 'czhang1306@berkeley.edu'
		fill_in 'Password', :with => '87654321'
		click_on 'Sign In'
		expect(page).to have_title "Log in"
	end

end