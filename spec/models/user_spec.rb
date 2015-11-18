require 'rails_helper'

RSpec.describe User, :type => :model do
	it "create valid user" do
		FactoryGirl.build(:user).should be_valid
	end
end