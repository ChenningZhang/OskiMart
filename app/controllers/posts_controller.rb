class PostsController < ApplicationController

    def new
        @post = Post.new
    end

    def create
      	@post = Post.new(post_params)
        if @post.save
          flash[:success] = "Your post has been posted!"
          # redirect_to_newsfeed page
        else
          render 'newsfeed'
        end
    end

    # not sure if needed
    def show
    	 @post = Post.all
    end

    def edit
        @post = Post.find(params[:id])
    end

    def update
        @post = Post.find(params[:id])
        if @post.update_attributes(post_params)
          flash[:success] = "Your post has been updated!"
          redirect_to @post
        else
          render 'edit'
        end
    end

    def destroy
        Post.destroy(params[:id])
        # redirect_to newsfeed
    end

    private
      	def post_params
      		  params.require(:post).permit(:title, :description, :category, :price)
      	end
end
