class PostsController < ApplicationController

    def new
        @post = Post.new
    end

    def create
      	@post = Post.new(post_params)
        if @post.save
          flash[:success] = "Your post has been posted!"
          redirect_to posts_path
        else
          render 'new'
        end
    end

    def show
        @post = Post.find(params[:id])
    end

    def index
        @posts = Post.all.order('created_at DESC')
    end

    def edit
        @post = Post.find(params[:id])
    end

    def update
        @post = Post.find(params[:id])
        if @post.update_attributes(post_params)
          flash[:success] = "Your post has been updated!"
          redirect_to(@post)
        else
          render 'edit'
        end
    end

    def destroy
        Post.destroy(params[:id])
        redirect_to posts_path
    end

    private
      	def post_params
      		  params.require(:post).permit(:title, :description, :category, :price)
      	end
end
