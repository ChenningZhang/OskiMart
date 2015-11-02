class PostsController < ApplicationController


    def new
        @post = Post.new
    end

    def create
      	@post = Post.new(post_params)
        if @post.save
          flash[:success] = "Your post has been posted!"
          render 'index'
        else
          render 'new'
        end
    end

    def show
        @post = Post.find(params[:id])
    end

    def index
        @posts = Post.all
    end

    def edit
        @post = Post.find(params[:id])
    end

    def update
        @post = Post.find(params[:id])
        if @post.update_attributes(post_params)
          flash[:success] = "Your post has been updated!"
          render 'index'
        else
          render 'new'
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
