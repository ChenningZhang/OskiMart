require 'rails_helper'

describe Post do
	it 'create valid post' do
		FactoryGirl.build(:user).should be_valid
	end
end