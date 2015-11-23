class ReviewController < ApplicationController
	before_action :authenticate_user!

	def new
		@review = Review.new
	end

	def create
		@review = Review.new(review_params)
		@user = User.find(params[:user_id])
		@review.user_id = params[:user_id]
		@user.reviews << @review

		if @review.save
			redirect_to @user
		else
			render 'new'
		end
	end

	def index
		@reviews = Review.all.where(:user_id => params[:user_id])
	end

	def show
		@review = Review.find(params[:id])
	end

	def destroy
		@review = Review.find(params[:id])
		if @review.user_id == current_user.id
			Review.destroy(params[:id])
			redirect_to posts_path
		end
	end

	private
		def review_params
			params.require(:post).permit(:user_id, :score, :feedback)
		end
end
