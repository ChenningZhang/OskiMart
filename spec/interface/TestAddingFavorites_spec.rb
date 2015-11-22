require 'rails_helper'
require 'selenium-webdriver'

RSpec.describe 'User creates posts to favorite and it ', :type => :feature do

	before(:each) do
		FactoryGirl.create(:user)

		visit @homepage_url
		click_on 'Log in'
		fill_in 'Email', :with => 'czhang1306@berkeley.edu'
		fill_in 'Password', :with => '12345678'
		click_on 'Sign In'

		click_on 'Create Post!'
		fill_in 'Title', :with => 'Book Title'
		fill_in 'Description', :with => 'Book Description'
		page.select 'Books', :from => 'post_category'
		page.select '$$', :from => 'post_price'
		click_on 'Create Post!'

		

		

	end

	# favorite post and check its there 

	it 'lets user put a post in favorites list and checks its in favorites page', :js => true do
		expect(page).to have_title "General Newsfeed"
		expect(page).to have_content 'Book Title'
		expect(page).to have_content 'Book Description'
		expect(page).to have_content 'Books'
		expect(page).to have_content '$$'
		click_on 'Favorite' 
		click_on 'Favorites'
		expect(page).to have_title  "Favorites"
		expect(page).to have_content 'Book Title'
	end

		
end