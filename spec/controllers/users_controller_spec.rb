require 'rails_helper'

#UsersController includes:

	#GET #show

RSpec.describe UsersController, :type => :controller do
	
	describe "GET #show" do
		login_user
		it 'renders the user profile page for the current user' do
			get :show, id: subject.current_user.id
			response.should render_template :show
		end
		# Should be able to show other users' profile as well
	end

end