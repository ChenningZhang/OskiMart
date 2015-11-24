require 'rails_helper'

#ConversationsController includes:
	#GET #new renders the page for creating a new conversation
	#POST #create creates a new conversation and redirects to the conversation's show path
	#GET #show renders a conversation's path
	#GET #index renders the view that manages all conversations
	#POST #reply replies to a message and then redirects to the conversation's show path
	#THE FOLLOWING METHODS ARE LIKELY SUBJECT FOR REFACTORING AND NOT YET TESTED
	#POST #restore ressurects a message from the trash
	#DELETE #empty_trash takes out the trash
	#DELETE #destroy

RSpec.describe ConversationsController, :type => :controller do
	
	describe "GET #new" do
		subject{get :new}
		login_user
		it 'renders the page for creating a new conversation' do
			expect(subject).to render_template('new')
		end
	end

	describe "POST #create" do
		create_second_user
		login_user
		it 'creates a new conversation for chatting, with the first message' do
			expect{
				post :create, message: {:body => "This is a body", :subject => "This is a subject"}, recipients: [@user2.id], commit: "Send"
			}.to change(@user2.mailbox.inbox, :count).by(1)
			expect(response).to redirect_to(conversation_path(@user2.mailbox.inbox.first))
		end
		#create another test to make sure a user can't message to himself?
	end

	describe "GET #show" do
		send_message_from_1_to_2_and_3
		login_second_user
		it 'shows a message if it exists and the user is one of the members and marks it as read only for the user' do
			get :show, id: @user2.mailbox.inbox.first.id
			expect(response).to render_template("show")
			expect(@user2.mailbox.inbox.first.is_unread?(@user3)).to be true
			expect(@user2.mailbox.inbox.first.is_unread?(@user2)).to be false
		end
		# it 'marks a message as read' do
		# 	expect
		# end
	end

	describe "GET #index" do
		subject{get :index}
		login_user
		it 'renders the inbox page for the current user' do
			expect(subject).to render_template('index')
		end
	end

	describe "POST #reply" do

		# it 'increases the number of receipts in a conversation by 1' do
			
		# end
	end

end