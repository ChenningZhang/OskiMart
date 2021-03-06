require 'faker'

FactoryGirl.define do
	factory :user do
		first_name "Chenning"
		last_name "Zhang"
		email "czhang1306@berkeley.edu"
		password "12345678"
	end

	factory :venmo_user, class: User do
		first_name "Chenning"
		last_name "Zhang"
		email "czhang1306@berkeley.edu"
		password "12345678"
		venmo_id "123"
	end

	factory :user2, class: User do
		first_name "John"
		last_name "Cena"
		email "johncena@berkeley.edu"
		password "wwesuperslam"
	end

	factory :user3, class: User do
		first_name "Dude"
		last_name "McHeGuy"
		email "dudeguy@berkeley.edu"
		password "genericpassword"
	end

	factory :user4, class: User do
		first_name "Girl"
		last_name "O'HerShe"
		email "girlshe@berkeley.edu"
		password "genericpassword"
	end

	factory :post do
		title "Test Title"
		description "Test description"
		category "Technology"
		price "$$"
		association :user, factory: :user, strategy: :build
	end

	factory :closed_post, class: ClosedPost do
		title "Test Title"
		description "Test description"
		category "Technology"
		price "$$"
		image "nil"
		association :user, factory: :user, strategy: :build
	end

	factory :post2, class: Post do 
		title "post 2 Title"
		description "post 2 description"
		category "Furniture"
		price "$$$"
		association :user, factory: :user, strategy: :build
	end

	factory :comment do
		text "Test comment"
		association :user, factory: :user
		association :post, factory: :post
	end

	factory :review do
		score "5"
		feedback "You are awesome"
		association :user, factory: :user, strategy: :build
	end
end