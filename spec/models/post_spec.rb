require 'rails_helper'

RSpec.describe Post, :type => :model do
	it 'create valid post' do
		FactoryGirl.build(:user).should be_valid
	end
end