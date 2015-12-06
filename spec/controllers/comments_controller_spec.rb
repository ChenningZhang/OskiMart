require 'rails_helper'

#CommentsController includes:
	#GET #new opens the add new comment page
	#POST #create
	#GET #show
	#GET #index
	#DELETE #destroy
	#GET #edit id goes to the update comment page
	#PUT #update comment updates the post and redirect to the comments page

RSpec.describe CommentsController, :type => :controller do


	describe "GET #new" do
		create_post
		it 'redirect to the create new comment page' do
			get :new
			response.should render_template 'new'
		end
	end

	describe "POST #create" do
		create_post
		it 'let the current user to make new comment with valid text' do
			expect{
				post :create, comment: FactoryGirl.attributes_for(:comment), commit: "Create Comment", post_id: @post.id
			}.to change(Comment, :count).by(1)
			
			response.should redirect_to comments_path(:post_id => @post.id)
		end

		it 'renders the comment_new page when missing comment text' do
			@comment = FactoryGirl.attributes_for(:comment, text: " ")
			expect{
				post :create, comment: @comment, commit: "Create Comment", post_id: @post.id
			}.to_not change(Comment, :count)

			response.should render_template 'new'
		end
	end

	describe "GET #index" do
		create_post
		it 'shows all comments for that post' do
			get :index, post_id: @post.id
			response.should render_template 'index'
		end

		it 'does not show comments as invalid post id' do
			get :index, post_id: ''
			response.should redirect_to posts_path
		end
	end

	describe "GET #edit" do
		create_comment
		it 'redirects to the update the selected comments' do
			get :edit, id: @comment.id
			response.should render_template 'edit'
		end
	end

	describe "GET #edit" do
		create_comment
		create_second_user
		login_second_user
		it 'redirects to the comments page as user not allowed to update the comment' do
			get :edit, id: @comment.id
			response.should redirect_to comments_path(:post_id => @post.id)
		end
	end

	describe "PUT #update" do
		create_comment
		it 'updates the comment with valid data' do
			put :update, comment: FactoryGirl.attributes_for(:comment, text: "New Text"), commit: 'update', id: @comment.id
			response.should redirect_to comments_path(:post_id => @post.id)
			Comment.find(@comment.id).text.should eq("New Text")
		end

		it 'does not update the comment with empty fields, and renders edit' do
			put :update, comment: FactoryGirl.attributes_for(:comment, text: " "), commit: 'update', id: @comment.id
			response.should render_template 'edit'
			Comment.find(@comment.id).text.should eq("Test comment")
		end
	end


	describe "DELETE #destroy" do
		create_comment
		it 'deletes the selected comment' do
			expect{
				delete :destroy, id: @comment.id
			}.to change(Comment, :count).by(-1)
			response.should redirect_to comments_path(:post_id => @post.id)
		end
	end

	describe "DELETE #destroy" do
		create_comment
		create_second_user
		login_second_user
		it 'does not delete the selected comment as the user did not write the comment' do
			expect{
				delete :destroy, id: @comment.id
			}.to change(Comment, :count).by(0)
			response.should redirect_to comments_path(:post_id => @post.id)
		end
	end
end