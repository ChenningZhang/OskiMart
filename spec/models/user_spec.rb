require 'rails_helper'

describe User do
	it "create valid user" do
		FactoryGirl.build(:user).should be_valid
	end
end