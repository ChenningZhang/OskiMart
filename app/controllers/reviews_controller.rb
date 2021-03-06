class ReviewsController < ApplicationController
	before_action :authenticate_user!

	def new
		if params[:user_id] != current_user.id
			@review = Review.new
		else
			redirect_to posts_path
		end
	end

	def create
		if params[:user_id] != current_user.id
			@review = Review.new(review_params)
			@user = User.find(params[:user_id])
			@review.user_id = @user.id
			@user.reviews << @review

			if @review.save
				redirect_to user_path(@user)
			else
				render 'new'
			end
		else
			redirect_to posts_path
		end
	end
	
	private
		def review_params
			params.require(:review).permit(:user_id, :score, :feedback)
		end
end
