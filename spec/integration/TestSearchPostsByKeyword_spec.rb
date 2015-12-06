require 'rails_helper'

RSpec.describe 'User search posts by keyword', :type => :feature do
	before(:each) do
		FactoryGirl.create(:user)
		visit @homepage_url
		click_on 'Log in'
		fill_in 'Email', :with => 'czhang1306@berkeley.edu'
		fill_in 'Password', :with => '12345678'
		click_on 'Sign In'
		expect(page).to have_title "Newsfeed"

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

	it 'lets user to find posts that contain the keyword' do
		expect(page).to have_title "Newsfeed"
		fill_in 'keywords', :with => '169'
		click_on 'Search'
		expect(page).to have_content '169 test service'
		expect(page).to have_content 'I can write tests for your project!'
		expect(page).to have_content 'Capybara'
		expect(page).to have_content 'This is not a real capybara, but a 169 capybara.'
	end

	it 'does not show any post when no post matches the keyword' do
		expect(page).to have_title "Newsfeed"
		fill_in 'keywords', :with => 'weird keyword'
		click_on 'Search'
		expect(page).to_not have_content 'Book Title'
		expect(page).to_not have_content 'This is a furniture'
		expect(page).to_not have_content 'This is another furniture'
		expect(page).to_not have_content '169 test service'
		expect(page).to_not have_content 'Capybara'
	end
end