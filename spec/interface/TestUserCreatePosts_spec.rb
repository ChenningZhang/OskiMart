require 'rails_helper'
require 'selenium-webdriver'

RSpec.describe 'User create post', :type => :feature do
	before(:each) do
		FactoryGirl.create(:user)
		visit @homepage_url
		click_on 'Log in'
		fill_in 'Email', :with => 'czhang1306@berkeley.edu'
		fill_in 'Password', :with => '12345678'
		click_on 'Sign In'
		expect(page).to have_title "Newsfeed Page"
	end

	it '', :js => true do
	end

	it '', :js => true do
	end
end