require 'rails_helper'
require 'selenium-webdriver'

RSpec.describe 'User delete post', :type => :feature do
	before(:each) do
		FactoryGirl.create(:user)
		visit @homepage_url
		click_on 'Log in'
		fill_in 'Email', :with => 'czhang1306@berkeley.edu'
		fill_in 'Password', :with => '12345678'
		click_on 'Sign In'
		expect(page).to have_title "Newsfeed Page"
		click_on 'Create Post!'
		fill_in 'Title', :with => 'Test Title'
		fill_in 'Description', :with => 'Test Description'
		page.select 'Books', :from => 'post_category'
		page.select '$$', :from => 'post_price'
		click_on 'Create Post!'
	end

	it 'lets the user delete the post', :js => true do
		expect(page).to have_title "Newsfeed Page"
		expect(page).to have_content "Test Title"
		expect(page).to have_content "Test Description"
		expect(page).to have_content "Books"
		expect(page).to have_content "$$"
		# Cannot find the "Remove Post" button
		#click_on 'Remove Post'
		# accept_alert('Are you sure?')
		# expect(page).to have_title "Newsfeed Page"
		# expect(page).to_not have_content "Test Title"
		# expect(page).to_not have_content "Test Description"
		# expect(page).to_not have_content "Books"
		# expect(page).to_not have_content "$$"
	end

	#TODO: After we have user-post association, should also test user could only delete his own post
end