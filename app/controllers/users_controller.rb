class UsersController < ApplicationController
  def new
  	@user = User.new
  end

  def show
  	@user = User.find(params[:id])
		puts user_signed_in?
		puts current_user
	end

  def create
  	@user = User.new(user_params)
  	if @user.save
  		flash[:success] = "Thanks for signing up. Welcome to OskiMart!"
  		redirect_to @user
  	else
  		render 'new'
  	end
  end

  private
  	def user_params
  		params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  	end
end
