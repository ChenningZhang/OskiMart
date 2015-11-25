require 'rails_helper'
require 'selenium-webdriver'

RSpec.describe 'User closes post', :type => :feature do
	before(:each) do
		FactoryGirl.create(:user)
		visit @homepage_url
		click_on 'Log in'
		fill_in 'Email', :with => 'czhang1306@berkeley.edu'
		fill_in 'Password', :with => '12345678'
		click_on 'Sign In'
		expect(page).to have_title "Newsfeed"

		click_on 'Create Post!'
		fill_in 'Title', :with => 'Test Title'
		fill_in 'Description', :with => 'Test Description'
		page.select 'Books', :from => 'post_category'
		page.select '$$', :from => 'post_price'
		click_on 'Create Post!'
	end

	it 'lets the user closes the post', :js => true do
		expect(page).to have_title "Newsfeed"
		expect(page).to have_content "Test Title"
		expect(page).to have_content "Test Description"

		click_on 'Close'
		accept_alert('Are you sure?')
		expect(page).to have_title "Newsfeed"
		expect(page).to_not have_content "Test Title"
		expect(page).to_not have_content "Test Description"

		click_on 'profile'
		click_on 'Closed posts'
		expect(page).to have_content "Test Title"
		expect(page).to have_content "Test Description"

		click_on 'Restore'
		expect(page).to_not have_content "Test Title"
		expect(page).to_not have_content "Test Description"
		visit '/posts'
		expect(page).to have_content "Test Title"
		expect(page).to have_content "Test Description"

		click_on 'Close'
		accept_alert('Are you sure?')
		click_on 'profile'
		click_on 'Closed posts'
		click_on 'Delete'
		accept_alert('Are you sure you want to delete this post forever?')
		expect(page).to_not have_content "Test Title"
		expect(page).to_not have_content "Test Description"
		visit '/posts'
		expect(page).to_not have_content "Test Title"
		expect(page).to_not have_content "Test Description"
	end

end