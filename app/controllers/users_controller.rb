class UsersController < ApplicationController
	before_action :authenticate_user!
	after_action :verify_authorized

	#def index
	#	@users = User.order('created_at DESC')
	#end

  def show
  	@user = User.find(params[:id])
		authorize @user
	end

end
