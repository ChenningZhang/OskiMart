require 'rails_helper'

RSpec.describe Review, type: :model do
	it 'creates valid review' do
		@user = FactoryGirl.create(:user)
		expect(FactoryGirl.build(:review, user_id: @user.id)).to be_valid
	end

	it 'fails to create review when feedback is blank' do
		@user = FactoryGirl.create(:user)
		expect(FactoryGirl.build(:review, feedback: "   ", user_id: @user.id)).not_to be_valid
	end

	it 'fails to create review when the score is out of range' do
		@user = FactoryGirl.create(:user)
		expect(FactoryGirl.build(:review, score: 0, user_id: @user.id)).not_to be_valid
		expect(FactoryGirl.build(:review, score: 6, user_id: @user.id)).not_to be_valid
	end
end
