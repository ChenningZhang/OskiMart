require 'rails_helper'

	#POST #create
	#GET #new

RSpec.describe ReviewsController, type: :controller do
	describe "POST #create" do
		login_user
		create_second_user
		it 'lets a user to review another user with valid review inputs' do
			expect { post :create, review: FactoryGirl.attributes_for(:review),
			 commit: "Submit Review", user_id: @user2.id }.to change(Review, :count).by(1)
			expect(response).to redirect_to @user2
		end

		it 'rejects review with empty feedback' do
			expect { post :create, review: FactoryGirl.attributes_for(:review, feedback: '   '),
			 commit: "Submit Review", user_id: @user2.id }.to_not change(Review, :count)
			expect(response).to render_template 'new'
		end

		it 'rejects review with too high or too low scores' do
			expect { post :create, review: FactoryGirl.attributes_for(:review, score: '0'),
			 commit: "Submit Review", user_id: @user2.id }.to_not change(Review, :count)
			expect(response).to render_template 'new'

			expect { post :create, review: FactoryGirl.attributes_for(:review, score: '6'),
			 commit: "Submit Review", user_id: @user2.id }.to_not change(Review, :count)
			expect(response).to render_template 'new'
		end
	end

	describe "GET #new" do
		login_user
		create_second_user
		#takes in a user_id, which cannot be the logged in user
		it 'renders new when the user_id takes in is valid' do
			get :new, user_id: @user2.id
			expect(response).to render_template 'new'
		end
	end
end
