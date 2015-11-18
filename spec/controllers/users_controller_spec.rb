require 'rails_helper'

RSpec.describe UsersController, :type => :controller do
	
	describe "GET #show" do
		login_user
		it 'render the user profile page for the current user' do
			get :show, id: subject.current_user.id
			response.should render_template :show
		end
	end
end