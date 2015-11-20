require 'rails_helper'

#SessionsController includes:
	#GET #new  this is when user create the login button. It leads user to the login page
	#DELETE #destroy this is when user click on log out. It logs the user out
	#POST #create this is when user enters correct email and password. It let user logs in

RSpec.describe Devise::SessionsController, :type => :controller do

	describe "GET #new" do
		devise_setup

		it 'renders the login page' do
			get :new
			response.should render_template('new')
		end
	end

	describe "POST #create" do
		user_signup
		
		it 'lets the user logs in with correct credentials and redirect_to newsfeed' do
			post :create, user: { email: @user.email, password: @user.password, remember_me: "0" }, commit: "Sign In"
			response.should redirect_to posts_path
			subject.current_user.should_not be_nil
		end

		it 'renders the login page with incorrect credentials' do
			post :create, user: { email: @user.email, password: 'wrong_password', remember_me: "0" }, commit: "Sign In"
			response.should render_template('new')
			subject.current_user.should be_nil
		end

	end

	describe "DELETE #destroy" do
		login_user

		it 'logs the current user out' do
			subject.current_user.should_not be_nil
			delete :destroy
			subject.current_user.should be_nil
			response.should redirect_to '/'
		end
	end
end