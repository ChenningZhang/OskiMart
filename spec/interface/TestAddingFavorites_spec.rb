require 'rails_helper'
require 'selenium-webdriver'

RSpec.describe 'Favorite Post', :type => :feature do

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

	it 'lets user favorite and Unfavorite a post', :js => true do
		expect(page).to have_title 'Newsfeed'
		# Click favorite, post is still there. Favorite button changed
		click_on 'Favorite'
		expect(page).to have_title 'Newsfeed'
		expect(page).to have_content "Book Title"
		expect(page).to have_content "Book Description"
		# Go to favorite list, post is there. Check Header.
		visit '/posts?favorites=true'
		expect(page).to have_css("h1", text: "Favorites")
		expect(page).to have_content "Book Title"
		expect(page).to have_content "Book Description"
		# Click Unfavorite. Post disappear. Check header.
		click_on 'Unfavorite'
		expect(page).to_not have_content "Book Title"
		expect(page).to_not have_content "Book Description"
		expect(page).to have_css("h1", text: "Favorites")
		# Post still in newsfeed. Check header and buttons.
		visit '/posts'
		expect(page).to have_css("h1", "General")
	end
end