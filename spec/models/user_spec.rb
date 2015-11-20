require 'rails_helper'

RSpec.describe User, :type => :model do
	it "create valid user" do
		FactoryGirl.build(:user).should be_valid
	end

	it "rejects empty first_name" do
		FactoryGirl.build(:user, first_name: '   ').should_not be_valid
	end

	it "rejects empty last_name" do
		FactoryGirl.build(:user, last_name: '   ').should_not be_valid
	end

	it "rejects empty email" do
		FactoryGirl.build(:user, email: '   ').should_not be_valid
	end

	it "rejects non-Berkeley email" do
		FactoryGirl.build(:user, email: 'not.berkeley@gmail.com').should_not be_valid
	end

	it "rejects less than 8 char password" do
		FactoryGirl.build(:user, password: '1234567').should_not be_valid
	end

	it "rejects duplicate email" do
		FactoryGirl.create(:user)
		FactoryGirl.build(:user, first_name: "New", last_name: "Name", password: "12345678").should_not be_valid
	end
end