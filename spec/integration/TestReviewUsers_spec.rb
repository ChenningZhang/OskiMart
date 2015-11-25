require 'rails_helper'

RSpec.describe 'Review Users', :type => :feature do
	before(:each) do
		@user1 = FactoryGirl.create(:user)
		@user2 = FactoryGirl.create(:user, first_name: 'test', last_name: 'review', email: 'test.review@berkeley.edu', password: 'password')
		visit @homepage_url
		click_on 'Log in'
		fill_in 'Email', :with => 'czhang1306@berkeley.edu'
		fill_in 'Password', :with => '12345678'
		click_on 'Sign In'
	end

	it 'lets a user to review another user with valid inputs' do
		visit '/users/'+@user2.id.to_s
		expect(page).to have_content 'No reviews to show'
		click_on 'Add Review'
		expect(page).to have_title 'Reviewing test review'
		page.select '5', :from => 'review_score'
		fill_in 'review_feedback', :with => 'This person is chill'
		click_on 'Submit Review'
		expect(page).to have_title 'test'
		expect(page).to have_content 'Score: 5'
		expect(page).to have_content 'Feedback: This person is chill'
	end

	it 'rejects reviews with blank feedback' do
		visit '/users/'+@user2.id.to_s
		expect(page).to have_content 'No reviews to show'
		click_on 'Add Review'
		expect(page).to have_title 'Reviewing test review'
		fill_in 'review_feedback', :with => '   '
		click_on 'Submit Review'
		expect(page).to have_title 'Reviewing test review'
		expect(page).to have_content 'Oops, something went wrong while adding a new review.'
		expect(page).to have_content "Feedback can't be blank"
		click_on 'Back'
		expect(page).to have_title 'test'
		expect(page).to have_content 'No reviews to show'
	end
	
end