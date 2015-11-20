require 'rails_helper'

#POST #create let user sign up

RSpec.describe RegistrationsController, :type => :controller do

	describe "POST #create" do
		devise_setup

		it 'lets user sign up with valid inputs' do
			expect{
				post :create, user: FactoryGirl.attributes_for(:user)
			}.to change(User, :count).by(1)
			response.should redirect_to posts_path
		end

		it 'renders registrations/new page with empty first_name' do
			expect{
				post :create, user: FactoryGirl.attributes_for(:user, first_name: "   ")
			}.to_not change(User, :count)
			response.should render_template("new")
		end

		it 'renders registrations/new page with empty last_name' do
			expect{
				post :create, user: FactoryGirl.attributes_for(:user, last_name: "   ")
			}.to_not change(User, :count)
			response.should render_template("new")
		end

		it 'renders registrations/new page with empty email' do
			expect{
				post :create, user: FactoryGirl.attributes_for(:user, email: "   ")
			}.to_not change(User, :count)
			response.should render_template("new")
		end

		it 'renders registrations/new page with empty password' do
			expect{
				post :create, user: FactoryGirl.attributes_for(:user, password: "   ")
			}.to_not change(User, :count)
			response.should render_template("new")
		end

		it 'renders registrations/new page with non-Berkeley email' do
			expect{
				post :create, user: FactoryGirl.attributes_for(:user, email: "test.user@gmail.com")
			}.to_not change(User, :count)
			response.should render_template("new")
		end

	end
end