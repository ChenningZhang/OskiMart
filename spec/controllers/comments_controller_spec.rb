# require 'rails_helper'

# #PostsController includes:
# 	#GET #new opens the create new post page
# 	#POST #create
# 	#GET #show
# 	#GET #index
# 	#DELETE #destroy
# 	#GET #edit id goes to the update post page
# 	#PUT #update post updates the post and redirect to the certain_post page

# RSpec.describe CommentsController, :type => :controller do

# 	describe "POST #create" do
# 		login_user
# 		it 'let the current user to make new comment with valid text' do
# 			expect{
# 				post :create, post: FactoryGirl.attributes_for(:post), commit: "Create Post"
# 			}.to change(Post, :count).by(1)

# 			# Post.find(@post.id).title.should eq("Test Title")
# 			# Post.find(@post.id).description.should eq("Test description")
# 			# Post.find(@post.id).category.should eq("Technology")
# 			# Post.find(@post.id).price.should eq("$$")

# 			response.should redirect_to posts_path
# 		end

# 		it 'renders the post_new page when missing post title' do
# 			@post = FactoryGirl.attributes_for(:post, title: "  ")
# 			expect{
# 				post :create, post: @post, commit: "Create Post"
# 			}.to_not change(Post, :count)

# 			response.should render_template 'new'
# 		end

# 		it 'renders the post_new page when missing post description' do
# 			@post = FactoryGirl.attributes_for(:post, description: "   ")
# 			expect{
# 				post :create, post: @post, commit: "Create Post"
# 			}.to_not change(Post, :count)

# 			response.should render_template 'new'
# 		end
# 	end

# 	describe "GET #show" do
# 		create_post
# 		it 'renders the post page for the selected post' do
# 			get :show, id: @post.id
# 			response.should render_template 'show'
# 		end
# 	end

# 	describe "GET #index" do
# 		login_user
# 		it 'shows all posts' do
# 		end
# 	end

# 	describe "DELETE #destroy" do
# 		# TODO: add more test cases after we have the association
# 		login_user
# 		it 'deletes the selected post' do
# 		end
# 	end

# end