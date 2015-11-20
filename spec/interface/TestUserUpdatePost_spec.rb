require 'rails_helper'
require 'selenium-webdriver'

RSpec.describe 'User update post', :type => :feature do
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

	# Can not find "Update Post" button

	it 'lets user update the post with valid inputs', :js => true do
		expect(page).to have_title "Newsfeed Page"
		expect(page).to have_content "Test Title"
		expect(page).to have_content "Test Description"
		expect(page).to have_content "Books"
		expect(page).to have_content "$$"
		click_on 'Update Post'
		fill_in 'Title', :with => 'New Title'
		fill_in 'Description', :with => 'New Description'
		page.select 'Furniture', :from => 'post_category'
		page.select '$$$', :from => 'post_price'
		click_on 'Update'

		expect(page).to have_content "New Title"
		expect(page).to have_content "New Description"
		expect(page).to have_content "Furniture"
		expect(page).to have_content "$$$"
	end

	it 'does not let user update the post with invalid inputs and renders errors', :js => true do
		expect(page).to have_title "Newsfeed Page"
		expect(page).to have_content "Test Title"
		expect(page).to have_content "Test Description"
		expect(page).to have_content "Books"
		expect(page).to have_content "$$"
		click_on 'Update Post'
		fill_in 'Title', :with => '   '
		fill_in 'Description', :with => '   '
		page.select 'Furniture', :from => 'post_category'
		page.select '$$$', :from => 'post_price'
		click_on 'Update'
		expect(page).to have_content "Oops, something went wrong while creating a new post."
		expect(page).to have_content "Title can't be blank"
		expect(page).to have_content "Description can't be blank"
		click_on 'Back'
		expect(page).to have_title "Newsfeed Page"
		expect(page).to have_content "Test Title"
		expect(page).to have_content "Test Description"
		expect(page).to have_content "Books"
		expect(page).to have_content "$$"
	end
end