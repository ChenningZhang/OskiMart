require "rails_helper"

RSpec.describe User, :type => :model do
	it 'should have valid field inputs' do
		expect { User.new(first_name: "  ", last_name: "abc", email: "abc@berkeley.edu", password: "12345678").save! }.to raise_error(ActiveRecord::RecordInvalid)
		expect { User.new(first_name: "abc", last_name: "  ", email: "abc@berkeley.edu", password: "12345678").save! }.to raise_error(ActiveRecord::RecordInvalid)
		expect { User.new(first_name: "abc", last_name: "abc", email: "  ", password: "12345678").save! }.to raise_error(ActiveRecord::RecordInvalid)
		expect { User.new(first_name: "abc", last_name: "abc", email: "abc@gmail.com", password: "12345678").save! }.to raise_error(ActiveRecord::RecordInvalid)
		expect { User.new(first_name: "abc", last_name: "abc", email: "abc@berkeley.edu", password: "1234567").save! }.to raise_error(ActiveRecord::RecordInvalid)
	end

	it 'should deny deplicate email case insensitive' do
		@user = User.create(first_name: "Test", last_name: "User", email: "test.user@berkeley.edu", password: "12345678")
		expect { User.new(first_name: "abc", last_name: "abc", email: "test.user@berkeley.edu", password: "12345678").save! }.to raise_error(ActiveRecord::RecordInvalid)
		@user.destroy
	end
end