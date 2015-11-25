require 'rails_helper'
require 'selenium-webdriver'

RSpec.describe 'User Access', :type => :feature do

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

	it 'lets user to comment post if the comment is not empty', :js => true do
		expect(page).to have_title "Newsfeed"
		click_on "Comments"
		expect(page).to have_title "Test Title"
		expect(page).to have_content "Test Title"
		expect(page).to have_content "Test Description"
		expect(page).to_not have_content "Comment:"

		click_on "Add Comment"
		expect(page).to have_title "Add comments for Test Title"
		fill_in 'comment_text', :with => 'You are awesome'
		click_on 'Comment'
		expect(page).to have_content "Comment: You are awesome"
		click_on 'Back'
		expect(page).to have_title "Newsfeed"
	end

	it 'lets user go back to post view on the add comment page', :js => true do
		expect(page).to have_title "Newsfeed"
		click_on "Comments"
		expect(page).to have_title "Test Title"
		expect(page).to have_content "Test Title"
		expect(page).to have_content "Test Description"
		expect(page).to_not have_content "Comment:"

		click_on "Add Comment"
		expect(page).to have_title "Add comments for Test Title"
		click_on "Back"
		expect(page).to have_title "Test Title"
	end

	it 'rejects the comment when it is empty', :js => true do
		expect(page).to have_title "Newsfeed"
		click_on "Comments"
		expect(page).to have_title "Test Title"
		expect(page).to have_content "Test Title"
		expect(page).to have_content "Test Description"
		expect(page).to_not have_content "Comment:"

		click_on "Add Comment"
		fill_in 'comment_text', :with => '   '
		click_on 'Comment'
		expect(page).to have_content "Oops, something went wrong while adding a new comment."
		expect(page).to have_content "Text can't be blank"
		expect(page).to have_title "Add comments for Test Title"
	end

	it 'lets user to updates his comment', :js => true do
		expect(page).to have_title "Newsfeed"
		click_on "Comments"
		expect(page).to have_title "Test Title"
		expect(page).to have_content "Test Title"
		expect(page).to have_content "Test Description"
		expect(page).to_not have_content "Comment:"

		click_on "Add Comment"
		expect(page).to have_title "Add comments for Test Title"
		fill_in 'comment_text', :with => 'You are awesome'
		click_on 'Comment'
		expect(page).to have_content "Comment: You are awesome"
		click_on "Update_comment"
		expect(page).to have_title "Updating Comment"
		fill_in 'comment_text', :with => 'You are more than just awesome'
		click_on 'Update'
		expect(page).to have_title "Test Title"
		expect(page).to have_content "Comment: You are more than just awesome"
		expect(page).to_not have_content "Comment: You are awesome"
	end

	it 'lets user go back to post view on update comment page', :js => true do
		expect(page).to have_title "Newsfeed"
		click_on "Comments"
		expect(page).to have_title "Test Title"
		expect(page).to have_content "Test Title"
		expect(page).to have_content "Test Description"
		expect(page).to_not have_content "Comment:"

		click_on "Add Comment"
		expect(page).to have_title "Add comments for Test Title"
		fill_in 'comment_text', :with => 'You are awesome'
		click_on 'Comment'
		expect(page).to have_content "Comment: You are awesome"
		click_on "Update_comment"
		expect(page).to have_title "Updating Comment"
		click_on 'Back'
		expect(page).to have_title "Test Title"
		expect(page).to have_content "Comment: You are awesome"
	end

	it 'lets user delete comment', :js => true do
		expect(page).to have_title "Newsfeed"
		click_on "Comments"
		expect(page).to have_title "Test Title"
		expect(page).to have_content "Test Title"
		expect(page).to have_content "Test Description"
		expect(page).to_not have_content "Comment:"

		click_on "Add Comment"
		expect(page).to have_title "Add comments for Test Title"
		fill_in 'comment_text', :with => 'You are awesome'
		click_on 'Comment'
		expect(page).to have_content "Comment: You are awesome"
		click_on 'Remove_comment'
		accept_alert("Are you sure?")
		expect(page).to have_title 'Test Title'
		expect(page).to_not have_content "Comment: You are awesome"
	end
end