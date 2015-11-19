class UsersController < ApplicationController
	before_action :authenticate_user!
	after_action :verify_authorized

	#def index
	#	@users = User.order('created_at DESC')
	#end

  def show
  	@user = User.find(params[:id])
    @posts = @user.posts
    @comments = @user.comments
		authorize @user
	end
<<<<<<< HEAD
	#deprecated because devise takes care of everything for us
  # def create
  # 	@user = User.new(user_params)
  # 	if @user.save
  # 		flash[:success] = "Thanks for signing up. Welcome to OskiMart!"
  #     puts 'lol'
		# 	redirect_to posts_path
  #   else
  # 		render 'new'
  # 	end
  # end

  private
  	def user_params
  		params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  	end
=======

>>>>>>> 01ec2f02f111c88dcb31dec20419e8bd4914ad5e
end
