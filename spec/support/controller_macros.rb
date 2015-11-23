module ControllerMacros
	def login_user
		before(:each) do
			@request.env["devise.mapping"] = Devise.mappings[:user]
			@user = FactoryGirl.create(:user)
			sign_in @user
		end
	end

	def devise_setup
		before(:each) do
			@request.env["devise.mapping"] = Devise.mappings[:user]
		end
	end

	def user_signup
		before(:each) do
			@request.env["devise.mapping"] = Devise.mappings[:user]
			@user = FactoryGirl.create(:user)
		end
	end

	def create_post
		before(:each) do
			@request.env["devise.mapping"] = Devise.mappings[:user]
			@user = FactoryGirl.create(:user)
			sign_in @user
			@post = FactoryGirl.create(:post, :user_id => @user.id)
		end
	end

	def create_posts
		before(:each) do
			@request.env["devise.mapping"] = Devise.mappings[:user]
			@user = FactoryGirl.create(:user)
			sign_in @user
			@post = FactoryGirl.create(:post, :user_id => @user.id)
			@post2 = FactoryGirl.create(:post, title: "Book Title", description: "Book Description", category: "Books", :user_id => @user.id)
			@post3 = FactoryGirl.create(:post, title: "This is a furniture", description: "A pretty good furniture", category: "Furniture", :user_id => @user.id)
			@post4 = FactoryGirl.create(:post, title: "169 test service", description: "I can write tests for your project!", category: "Service", price: "$$$", :user_id => @user.id)
			@post5 = FactoryGirl.create(:post, title: "Capybara", description: "This is not a real capybara, but a 169 capybara.", category: "Other", price: "$", :user_id => @user.id)
		end
	end

	def create_comment
		before(:each) do
			@request.env["devise.mapping"] = Devise.mappings[:user]
			@user = FactoryGirl.create(:user)
			sign_in @user
			@post = FactoryGirl.create(:post)
			@comment = FactoryGirl.create(:comment, :post_id => @post.id, :user_id => @user.id)
		end
	end
end