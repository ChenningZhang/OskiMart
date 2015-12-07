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
		expect(page).to have_title "Newsfeed"
	end

	it 'lets user create a post with valid inputs(without image)', :js => true do
		click_on 'Create Post!'
		fill_in 'Title', :with => 'Test Title'
		fill_in 'Description', :with => 'Test Description'
		page.select 'Books', :from => 'post_category'
		page.select '$$', :from => 'post_price'
		click_on 'Create Post!'
		expect(page).to have_title "Newsfeed"
		expect(page).to have_content "Test Title"
		expect(page).to have_content "Test Description"
		expect(page).to have_content "Books"
		expect(page).to have_content "$$"
	end

	it 'lets user create a post with valid inputs(with an image)', :js => true do
		click_on 'Create Post!'
		fill_in 'Title', :with => 'Test Title'
		fill_in 'Description', :with => 'Test Description'
		page.select 'Books', :from => 'post_category'
		page.select '$$', :from => 'post_price'
		fill_in 'post_remote_image_url', :with => 'http://www.sdpk.eu/wp-content/uploads/2014/07/number-2-u-s-president-barack-obama-second-most-admired-person-planet.jpg'
		click_on 'Create Post!'
		expect(page).to have_title "Newsfeed"
		expect(page).to have_content "Test Title"
		expect(page).to have_content "Test Description"
		expect(page).to have_content "Books"
		expect(page).to have_content "$$"
	end

	it 'does not let user create a post with empty fields, and renders errors', :js => true do
		click_on 'Create Post!'
		fill_in 'Title', :with => '   '
		fill_in 'Description', :with => '   '
		page.select 'Books', :from => 'post_category'
		page.select '$$', :from => 'post_price'
		click_on 'Create Post!'
		expect(page).to have_title "Create Post"
		expect(page).to have_content "Oops, something went wrong."
		expect(page).to have_content "Title can't be blank"
		expect(page).to have_content "Description can't be blank"
	end

end