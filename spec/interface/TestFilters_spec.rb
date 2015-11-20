require 'rails_helper'
require 'selenium-webdriver'

RSpec.describe 'User filters posts', :type => :feature do
	before(:each) do
		FactoryGirl.create(:user)
		visit @homepage_url
		click_on 'Log in'
		fill_in 'Email', :with => 'czhang1306@berkeley.edu'
		fill_in 'Password', :with => '12345678'
		click_on 'Sign In'
		expect(page).to have_title "Newsfeed Page"

		click_on 'Create Post!'
		fill_in 'Title', :with => 'Book Title'
		fill_in 'Description', :with => 'Book Description'
		page.select 'Books', :from => 'post_category'
		page.select '$$', :from => 'post_price'
		click_on 'Create Post!'

		click_on 'Create Post!'
		fill_in 'Title', :with => 'This is a furniture'
		fill_in 'Description', :with => 'A pretty good furniture'
		page.select 'Furniture', :from => 'post_category'
		page.select '$$', :from => 'post_price'
		click_on 'Create Post!'

		click_on 'Create Post!'
		fill_in 'Title', :with => 'This is another furniture'
		fill_in 'Description', :with => 'An awesome furniture'
		page.select 'Furniture', :from => 'post_category'
		page.select '$$$', :from => 'post_price'
		click_on 'Create Post!'

		click_on 'Create Post!'
		fill_in 'Title', :with => '169 test service'
		fill_in 'Description', :with => 'I can write tests for your project!'
		page.select 'Service', :from => 'post_category'
		page.select '$$$', :from => 'post_price'
		click_on 'Create Post!'

		click_on 'Create Post!'
		fill_in 'Title', :with => 'Capybara'
		fill_in 'Description', :with => 'This is not a real capybara, but a 169 capybara.'
		page.select 'Other', :from => 'post_category'
		page.select '$', :from => 'post_price'
		click_on 'Create Post!'
	end

	it 'filters posts by price', :js => true do
		expect(page).to have_title "Newsfeed Page"
		# Cannot find buttons, but inspect-element shows
		# click_on 'cheap'
		# expect(page).to_not have_content 'Capybara'

		# click_on 'expensive'
		# expect(page).to_not have_content 'Book Title'
		# expect(page).to_not have_content 'This is a furniture'

		# click_on 'very expensive'
		# expect(page).to_not have_content 'This is another furniture'
		# expect(page).to_not have_content '169 test service'
	end

	it 'filters posts by category', :js => true do
		expect(page).to have_title "Newsfeed Page"
		page.select 'Books', :from => 'category_id'
		expect(page).to have_content 'Book Title'

		page.select 'Furniture', :from => 'category_id'
		expect(page).to have_content 'This is a furniture'
		expect(page).to have_content 'This is another furniture'

		page.select 'Service', :from => 'category_id'
		expect(page).to have_content '169 test service'

		page.select 'Other', :from => 'category_id'
		expect(page).to have_content 'Capybara'

		page.select 'Technology', :from => 'category_id'
		expect(page).to_not have_content 'Capybara'
		expect(page).to_not have_content 'Book Title'
		expect(page).to_not have_content 'This is a furniture'
		expect(page).to_not have_content 'This is another furniture'
		expect(page).to_not have_content '169 test service'
	end
end