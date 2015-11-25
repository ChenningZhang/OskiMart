require 'rails_helper'

#VenmoController includes:

	#GET #callback
	#GET #initialisze_payment
	#GET #final_payment

RSpec.describe VenmoController, :type => :controller do
	

	# feature 'External request' do
	#   it 'makes request to venmo api' do
	#   	url = URI.parse('https://api.venmo.com/v1/oauth/access_token')
	#     response = Net::HTTP.get(url)

	#     expect(response).to be_an_instance_of(String)
	#   end
	# end

	# describe "GET #callback" do
	# 	login_user
	# 	it 'directs to venmo access page' do
	# 		get :callback
	# 		response.should render_template :show
	# 	end
	# 	# Should be able to show other users' profile as well

		
	# end

end