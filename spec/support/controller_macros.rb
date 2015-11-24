module ControllerMacros
	def login_user
		before(:each) do
			@request.env["devise.mapping"] = Devise.mappings[:user]
			@user = FactoryGirl.create(:user)
			sign_in @user
		end
	end

	def login_user3
		before(:each) do
			@request.env["devise.mapping"] = Devise.mappings[:user3]
			@user = FactoryGirl.create(:user3)
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
			request.env["HTTP_REFERER"] = "http://test.host/posts"
		end
	end

	def create_post_logout
		before(:each) do
			@request.env["devise.mapping"] = Devise.mappings[:user]
			@user = FactoryGirl.create(:user)
			sign_in @user
			@post = FactoryGirl.create(:post, :user_id => @user.id)
			sign_out @user
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

	def create_comment_logout
		before(:each) do
			@request.env["devise.mapping"] = Devise.mappings[:user]
			@user = FactoryGirl.create(:user)
			sign_in @user
			@post = FactoryGirl.create(:post, :user_id => @user.id)
			@comment = FactoryGirl.create(:comment, :post_id => @post.id, :user_id => @user.id)
			sign_out @user
		end
	end
end