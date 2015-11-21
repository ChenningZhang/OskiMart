require 'rails_helper'

RSpec.describe Post, :type => :model do
	it 'create valid post' do
		FactoryGirl.build(:post, user_id: 1).should be_valid
	end

	it 'rejects empty title' do
		FactoryGirl.build(:post, title: '   ').should_not be_valid
	end

	it 'rejects empty description' do
		FactoryGirl.build(:post, description: '   ').should_not be_valid
	end

	it 'rejects not exist category' do
		FactoryGirl.build(:post, category: 'Invalid').should_not be_valid
	end

	it 'rejects invalid price' do
		FactoryGirl.build(:post, price: '$$$$').should_not be_valid
	end
end