require 'rails_helper'

RSpec.describe Post, :type => :model do
	it 'create valid post' do
		FactoryGirl.build(:post, :user_id => 1).should be_valid
	end
end