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

    def show
        @closed_post = ClosedPost.find(params[:id])
    end

    def index
    	@closed_posts = ClosedPost.all.where(:user_id => params[:user_id])
    end

    def restore
      @closed_post = ClosedPost.find(params[:post_id])
      @post = Post.create(:user_id => current_user.id, :title => @closed_post.title, :description => @closed_post.description, :category => @closed_post.category, :price => @closed_post.price, :image => @closed_post.image)
      current_user.posts << @post
      ClosedPost.destroy(params[:post_id])
      redirect_to closed_posts_path(:user_id => current_user.id)
    end

    def destroy
      @closed_post = ClosedPost.find(params[:id])
      if current_user.id != @closed_post.user_id
          redirect_to closed_posts_path(:user_id => current_user.id)
      else
          ClosedPost.destroy(params[:id])
          redirect_to closed_posts_path(:user_id => current_user.id)
      end
    end

    private
      	def closed_post_params
      		  params.require(:closed_post).permit(:user_id, :title, :description, :category, :price, :image)
      	end
end
