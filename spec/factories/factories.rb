require 'faker'

FactoryGirl.define do
	factory :user do
		first_name "Chenning"
		last_name "Zhang"
		email "czhang1306@berkeley.edu"
		password "12345678"
	end

	factory :post do
		title "Test Title"
		description "Test description"
		category "Technology"
		price "$$"
		association :user, factory: :user, strategy: :build
	end

	factory :comment do
		text "New comment"
		association :user, factory: :user
		association :post, factory: :post
	end
end