require 'rails_helper'

RSpec.describe ClosedPostsController, type: :controller do

	describe "POST #create" do
		login_user
		it 'current user makes a closed post' do
			expect{
				post :create, closed_post: FactoryGirl.attributes_for(:closed_post, :user_id => @user.id), commit: "Create Closed Post"
			}.to change(ClosedPost, :count).by(1)
			response.should redirect_to :back
		end
	end

	describe "GET #index" do
		create_closed_post
		it 'shows all closed posts' do
			get :index 
			response.should render_template 'index'
			ClosedPost.find(@closed_post.id).title.should eq("Test Title")
			ClosedPost.find(@closed_post.id).description.should eq("Test description")
		end
	end

	describe "GET #restore" do
		create_closed_post
		it 'restores the closed post and deletes it from closed post database' do
			expect{
				get :restore, post_id: @closed_post.id
				}.to change(ClosedPost, :count).by(-1)
			response.should redirect_to closed_posts_path(:user_id => @user.id)
		end

		it 'restores the closed post into posts database' do
			expect{
				get :restore, post_id: @closed_post.id
				}.to change(Post, :count).by(1)
			response.should redirect_to closed_posts_path(:user_id => @user.id)
		end
	end

	describe "DELETE #destroy" do
		create_closed_post
		create_second_user
		login_second_user
		it 'does not delete the closed post' do
			expect{
				delete :destroy, id: @closed_post.id
			}.to_not change(ClosedPost, :count)
			response.should redirect_to closed_posts_path(:user_id => @user2.id)

		end
	end

	describe "DELETE #destroy" do
		create_closed_post
		it 'deletes the closed post' do
			expect{
				delete :destroy, id: @closed_post.id
			}.to change(ClosedPost, :count).by(-1)
			response.should redirect_to closed_posts_path(:user_id => @user.id)

		end
	end


end
