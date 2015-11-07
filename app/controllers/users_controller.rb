class UsersController < ApplicationController
	before_action :authenticate_user!
	after_action :verify_authorized

	def new
  	@user = User.new
  end

	#def index
	#	@users = User.order('created_at DESC')
	#end

  def show
  	@user = User.find(params[:id])
		authorize @user
	end

  def create
  	@user = User.new(user_params)
  	if @user.save
  		flash[:success] = "Thanks for signing up. Welcome to OskiMart!"
      puts 'lol'
			redirect_to posts_path
    else
  		render 'new'
  	end
  end

  private
  	def user_params
  		params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  	end
end
