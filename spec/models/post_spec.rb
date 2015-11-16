require "rails_helper"

RSpec.describe Post, :type => :model do
	it 'should have valid field inputs' do
		expect{ Post.new(title: "  ", description: "Test description", category: "Technology", price: "$$").save! }.to raise_error(ActiveRecord::RecordInvalid)
		expect{ Post.new(title: "Test title", description: "   ", category: "Technology", price: "$$").save! }.to raise_error(ActiveRecord::RecordInvalid)
	end

end