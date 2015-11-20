class UsersController < ApplicationController
	before_action :authenticate_user!
	#after_action :verify_authorized

	#def index
	#	@users = User.order('created_at DESC')
	#end

  # if we need to edit user profile use the following 
  #  def edit
  #   @user = User.find(params[:id])
  # end

  def show
  	@user = User.find(params[:id])
    @posts = @user.posts
    @comments = @user.comments
		authorize @user

	end

end
