module ControllerMacros
	def login_user
		before(:each) do
			@request.env["devise.mapping"] = Devise.mappings[:user]
			@user = FactoryGirl.create(:user)
			sign_in @user
		end
	end

	def create_second_user
		before(:each) do
			@request.env["devise.mapping"] = Devise.mappings[:user]
			@user2 = FactoryGirl.create(:user2)
		end
	end

	def create_third_user
		before(:each) do
			@request.env["devise.mapping"] = Devise.mappings[:user]
			@user3 = FactoryGirl.create(:user3)
		end
	end

	def create_fourth_user
		before(:each) do
			@request.env["devise.mapping"] = Devise.mappings[:user]
			@user4 = FactoryGirl.create(:user4)
		end
	end

	# def login_second_user
	# 	@request.env["devise.mapping"] = Devise.mappings[:user]
	# 	@user2.login_user
	# end

	# def login_third_user
	# 	@request.env["devise.mapping"] = Devise.mappings[:user]
	# 	@user3.login_user
	# end

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
			@post = FactoryGirl.create(:post)
			@comment = FactoryGirl.create(:comment, :post_id => @post.id, :user_id => @user.id)
		end
	end

	# def send_message_from_1_to_2_and_3
	# 	@request.env["devise.mapping"] = Devise.mappings[:user]
	# 	@user = FactoryGirl.create(:user)
	# 	@user2 = FactoryGirl.create(:user2)
	# 	@user3 = FactoryGirl.create(:user3)
	# 	sign_in @user
		
	# end
end