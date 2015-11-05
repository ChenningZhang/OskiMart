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
      puts "search/index called"
      puts params
        if params[:keywords]
          @posts = Post.search(params[:keywords], params[:category]).order("created_at DESC")
          #redirect_to posts_path
          puts @posts.inspect
        else
          @posts = Post.all.order('created_at DESC')
       end
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
