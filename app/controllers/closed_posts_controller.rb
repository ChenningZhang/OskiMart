class ClosedPostsController < ApplicationController
	before_action :authenticate_user!

    def new
        @post = ClosedPost.new
    end

    def create
      	@closed_post = ClosedPost.new(closed_post_params)
        @closed_post.user_id = current_user.id
        current_user.closed_posts << @closed_post
        @closed_post.save
    end

    def index
    	@closed_posts = ClosedPost.all
    end

    private
      	def closed_post_params
      		  params.require(:closed_post).permit(:user_id, :title, :description, :category, :price, :image)
      	end
end
