require 'rails_helper'

#VenmoController includes:

	#GET #callback
	#GET #initialisze_payment
	#GET #final_payment

RSpec.describe VenmoController, :type => :controller do

	describe "GET #callback" do
		login_user
		it 'directs to venmo access page' do
			get :callback
			response.should redirect_to user_path(@user.id)

		end		
	end

	describe "GET #initialize_payment" do
		login_user
		it 'does not direct to venmo access page' do
			get :initialize_payment, receiver: @user.id
			response.should redirect_to :back
		end		
	end

	describe "GET #initialize_payment" do
		login_venmo_user
		it 'directs to venmo access page' do
			get :initialize_payment, receiver: @venmo_user.id
			response.should render_template 'show'
		end		
	end

	describe "GET #final_payment" do
		login_venmo_user
		it 'directs to venmo payment form' do
			get :final_payment, amount: '', description: ''
			response.should redirect_to :back
		end	

		it 'directs to venmo payment form' do
			get :final_payment, amount: '0.01', description: 'for books', receiver: @venmo_user.id
			response.should redirect_to user_path(@venmo_user.id)
		end	

		it 'directs to venmo payment form' do
			get :final_payment, amount: '0.01', description: 'for books', receiver: @venmo_user.id, charge: 'true'
			response.should redirect_to user_path(@venmo_user.id)
		end		
	end

end