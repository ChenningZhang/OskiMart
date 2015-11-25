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
		it 'shows a message if it exists and the user is one of the members' do
			get :show, id: @conversation.id
			expect(response).to render_template("show")
		end

		it 'marks a message as read for only the user who opened it and no one else' do
			expect(@conversation.is_unread?(@user3)).to be true
			expect(@conversation.is_unread?(@user2)).to be true
			get :show, id: @conversation.id
			expect(@conversation.is_unread?(@user3)).to be true
			expect(@conversation.is_unread?(@user2)).to be false
		end

	end

	describe "GET #index" do
		subject{get :index}
		login_user
		it 'renders the inbox page for the current user' do
			expect(subject).to render_template('index')
		end
	end

	describe "POST #reply" do
		send_message_from_1_to_2_and_3
		login_second_user
		it 'increases the number of receipts in a conversation by 1' do
			expect{
				post :reply, id: @conversation.id, body: "Test reply", commit: "Send Message"
			}.to change(@conversation.receipts_for(@user2), :count).by(1)
		end
	end

	describe "DELETE #destroy" do
		send_message_from_1_to_2_and_3
		login_second_user
		it 'ensures that the message will be gone from the user\'s inbox and into the trash' do
			expect(@user2.mailbox.trash.size).to eq(0)
			expect(@user2.mailbox.inbox.size).to eq(1)
			expect{
				delete :destroy, id: @conversation.id
			}.to change(@user2.mailbox.inbox, :count).by(-1)
			expect(@user2.mailbox.inbox.size).to eq(0)
			expect(@user2.mailbox.trash.size).to eq(1)
		end
	end

	describe "POST #restore" do
		send_message_from_1_to_2_and_3
		delete_conversation_for_2
		login_second_user
		it 'should take a deleted convo out from the deleted box and into the inbox' do
			expect(@user2.mailbox.trash.size).to eq(1)
			expect(@user2.mailbox.inbox.size).to eq(0)
			expect{
				post :restore, id: @conversation.id
			}.to change(@user2.mailbox.inbox, :count).by(1)
			expect(@user2.mailbox.trash.size).to eq(0)
			expect(@user2.mailbox.inbox.size).to eq(1)
		end
	end

	describe "DELETE #empty_trash" do
		send_message_from_1_to_2_and_3
		send_message_from_2_to_1
		delete_conversation_for_2
		login_second_user
		it 'should remove all messages from the trash. No other boxes should be affected' do
			expect(@user2.mailbox.trash.size).to eq(1)
			expect(@user2.mailbox.inbox.size).to eq(0)
			expect(@user2.mailbox.sentbox.size).to eq(1)
			expect{
				delete :empty_trash
			}.to change(@user2.mailbox.trash, :count).by(-1)
			expect(@user2.mailbox.trash.size).to eq(0)
			expect(@user2.mailbox.inbox.size).to eq(0)
			expect(@user2.mailbox.sentbox.size).to eq(1)
		end
	end
end