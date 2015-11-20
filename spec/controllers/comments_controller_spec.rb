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

	# describe "GET #show" do
	# 	create_post
	# 	it 'renders the post page for the selected post' do
	# 		get :show, id: @post.id
	# 		response.should render_template 'show'
	# 	end
	# end

	# describe "GET #index" do
	# 	login_user
	# 	it 'shows all posts' do
	# 	end
	# end

	# describe "DELETE #destroy" do
	# 	# TODO: add more test cases after we have the association
	# 	login_user
	# 	it 'deletes the selected post' do
	# 	end
	# end

end