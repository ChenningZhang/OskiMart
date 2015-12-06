require 'rails_helper'
require 'selenium-webdriver'

RSpec.describe 'Messager', :type => :feature do

	before(:each) do
		@user1 = FactoryGirl.create(:user)
		@user2 = FactoryGirl.create(:user, first_name: 'test', last_name: 'messager', email: 'test.messager@berkeley.edu', password: 'password')
		visit @homepage_url
		click_on 'Log in'
		fill_in 'Email', :with => 'czhang1306@berkeley.edu'
		fill_in 'Password', :with => '12345678'
		click_on 'Sign In'
	end

	it 'lets two users communicate', :js => true do
		expect(page).to have_title 'Newsfeed'
		click_on 'profile'
		expect(page).to have_title 'Chenning'
		click_on 'Message'
		expect(page).to have_title 'Conversations'
		click_on 'Start conversation'
		expect(page).to have_title 'New Conversation'

		# First user send message
		click_on 'Send'
		expect(page).to have_title 'New Conversation'
		fill_in 'message_subject', :with => 'hello'
		click_on 'Send'
		expect(page).to have_title 'New Conversation'

		fill_in 'message_body', :with => 'Give me money'
		page.select 'test messager', :from => 'recipients'
		click_on 'Send'

		expect(page).to have_title 'Current Conversation'
		expect(page).to have_content 'Subject: hello'
		expect(page).to have_content 'Give me money'

		fill_in 'body', :with => 'Who are you?'
		click_on 'Send Message'
		expect(page).to have_content 'Subject: hello'
		expect(page).to have_content 'Give me money'
		expect(page).to have_content 'Who are you?'
		click_on 'Back'
		expect(page).to have_title 'Conversations'

		# Message should be in Sent Box
		visit '/conversations?box=sent'
		expect(page).to have_content "Subject: "

		click_on 'Logout'
		click_on 'Log in'
		fill_in 'Email', :with => 'test.messager@berkeley.edu'
		fill_in 'Password', :with => 'password'
		click_on 'Sign In'
		expect(page).to have_title 'Newsfeed'

		# Second user should received it
		click_on 'profile'
		expect(page).to have_title 'test'
		click_on 'Message'

		click_on 'hello'
		expect(page).to have_title 'Current Conversation'
		expect(page).to have_content 'Subject: hello'
		expect(page).to have_content 'Give me money'
		expect(page).to have_content 'Who are you?'

		fill_in 'body', :with => 'I am a ghost'
		click_on 'Send Message'
		expect(page).to have_title 'Current Conversation'
		expect(page).to have_content 'Subject: hello'
		expect(page).to have_content 'Give me money'
		expect(page).to have_content 'Who are you?'
		expect(page).to have_content 'I am a ghost'

		click_on 'Back'
		expect(page).to have_title 'Conversations'
		expect(page).to have_content "Subject: "
		visit '/conversations?box=sent'
		expect(page).to have_content "Subject: "

		# Check delete conversation
		click_on 'Move to trash'
		accept_alert('Are you sure?')
		expect(page).to_not have_content "Subject: "
		visit '/conversations?box=inbox'
		expect(page).to_not have_content "Subject: "
		visit '/conversations?box=trash'
		expect(page).to have_content "Subject: "

		# Check restore
		click_on 'Restore'
		visit '/conversations?box=trash'
		expect(page).to_not have_content "Subject: "
		visit '/conversations?box=inbox'
		expect(page).to have_content "Subject: "
		click_on 'Move to trash'
		accept_alert('Are you sure?')

		# Check empty trash
		visit '/conversations?box=trash'
		expect(page).to have_content "Subject: "
		click_on 'Empty trash'
		accept_alert('Are you sure?')

		visit '/conversations?box=inbox'
		expect(page).to_not have_content "Subject: "
		visit '/conversations?box=sent'
		expect(page).to_not have_content "Subject: "
		visit '/conversations?box=trash'
		expect(page).to_not have_content "Subject: "
	end

end