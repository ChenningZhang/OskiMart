class UsersController < ApplicationController
	before_action :authenticate_user!


  def show
  	@user = User.find(params[:id])
    @posts = @user.posts
    @comments = @user.comments
    @reviews = @user.reviews

  end


  def update
        @user = User.find(params[:id])
        if @user.update_attributes(user_params)
          flash[:success] = "Your profile has been updated!"
          redirect_to(@user)
        else
          render 'update'
        end
    end
  
end
