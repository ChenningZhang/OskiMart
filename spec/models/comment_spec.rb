require 'rails_helper'

RSpec.describe Comment, :type => :model do
	it 'create valid comment' do
		FactoryGirl.build(:comment, :user_id => 1, :post_id => 17).should be_valid
	end

	it 'check invalid comment' do
		FactoryGirl.build(:comment, :user_id => '', :post_id => '').should_not be_valid
	end

	it 'text should not be empty' do
		FactoryGirl.build(:comment, :text => '', :user_id => 1, :post_id => 1).should_not be_valid
	end
end