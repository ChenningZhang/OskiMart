module ControllerMacros
	def login_user
		before(:each) do
			@request.env["devise.mapping"] = Devise.mappings[:user]
			@user = FactoryGirl.create(:user)
			sign_in @user
		end
	end

	def login_user2
		before(:each) do
			@request.env["devise.mapping"] = Devise.mappings[:user2]
			@user = FactoryGirl.create(:user2)
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

	def create_comment
		before(:each) do
			@request.env["devise.mapping"] = Devise.mappings[:user]
			@user = FactoryGirl.create(:user)
			sign_in @user
			@post = FactoryGirl.create(:post, :user_id => @user.id)
			@comment = FactoryGirl.create(:comment, :post_id => @post.id, :user_id => @user.id)
		end
	end
end