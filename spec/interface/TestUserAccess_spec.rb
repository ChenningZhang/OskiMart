require 'rails_helper'
require 'selenium-webdriver'

# only post owner have update and close access on each post
# only comment owner gets to delete and update comment
# user only see update image fields on his own profile page
# no 'Add Review' button on user's own profile page

RSpec.describe 'User Access', :type => :feature do
	before(:each) do
		@user1 = FactoryGirl.create(:user)
		@user2 = FactoryGirl.create(:user2)
		@post = FactoryGirl.create(:post, :user_id => @user2.id)
		@comment = FactoryGirl.create(:comment, :user_id => @user1.id, :post_id => @post.id)

		visit @homepage_url
		click_on 'Log in'
		fill_in 'Email', :with => 'czhang1306@berkeley.edu'
		fill_in 'Password', :with => '12345678'
		click_on 'Sign In'
		expect(page).to have_title "Newsfeed"
	end

	it 'does not allow non-post-owner to update and close post', :js => true do
		expect(page).to have_content "Test Title"
		expect(page).to have_content "Test description"
		expect(page).to_not have_selector "Update"
		expect(page).to_not have_selector "Close"
	end

	it 'only allows comment owner to update and delete comment', :js => true do
		expect(page).to have_content "Test Title"
		expect(page).to have_content "Test description"

		click_on 'Comments'
		expect(page).to have_content "Comment: Test comment"
		expect(page).to have_selector('#Update_comment', visible: true)
		expect(page).to have_selector('#Remove_comment', visible: true)

		click_on 'Logout'
		visit @homepage_url
		click_on 'Log in'
		fill_in 'Email', :with => 'johncena@berkeley.edu'
		fill_in 'Password', :with => 'wwesuperslam'
		click_on 'Sign In'
		expect(page).to have_title "Newsfeed"

		expect(page).to have_content "Test Title"
		expect(page).to have_content "Test description"

		click_on 'Comments'
		expect(page).to have_content "Comment: Test comment"
		expect(page).to_not have_selector('#Update_comment', visible: true)
		expect(page).to_not have_selector('#Remove_comment', visible: true)
	end

	it 'only shows update image fields on the user own profile page', :js => true do
		click_on 'profile'
		expect(page).to have_selector('#edit_user_'+@user1.id.to_s, visible: true)
		visit '/users/' + @user2.id.to_s
		expect(page).to_not have_selector('#edit_user_'+@user1.id.to_s, visible: true)
	end

	it 'only shows Add Review button on other user profile page', :js => true do
		click_on 'profile'
		expect(page).to_not have_selector "Add Review"
		visit '/users/' + @user2.id.to_s
		click_on 'Add Review'
		expect(page).to have_title 'Reviewing John Cena'
	end
end