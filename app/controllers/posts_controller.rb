class PostsController < ApplicationController
  before_action :authenticate_user!

    def new
        @post = Post.new

    end


    def back
      redirect_to :back
    rescue ActionController::RedirectBackError
      redirect_to root_path
    end


    # favorite a post method
    def favorite
      @post = Post.find(params[:post_id])

      if current_user.favorites.include?(@post)
        current_user.favorites.delete(@post)
      else
        current_user.favorites << @post
      end

      back

    end


    # render favorite list on vie


    def create
      	@post = Post.new(post_params)
        @post.user_id = current_user.id
        current_user.posts << @post

        if @post.save
          flash[:success] = "Your post has been posted!"
          redirect_to posts_path
        else
          render 'new'
        end
    end

    def show
        @post = Post.find(params[:id])
        @comments = @post.comments
    end

    def index

      if params[:price] #if filter
        @posts = Post.filter(params[:price]).order("created_at DESC").paginate(page: params[:page], per_page: 5)
        @title = "Price: " + params[:price]
      elsif params[:keywords] #if search
        @posts = Post.search(params[:keywords]).order("created_at DESC").paginate(page: params[:page], per_page: 5)
        @title = "General Newsfeed \n Search Results: " + params[:keywords]
        #if @posts.empty?
          #render "posts/index", :locals=> {:search_err => 'No search results returned'}

      elsif not params[:category_id].nil? and not params[:category_id].empty? 
        @posts = Post.where(:category => params[:category_id]).order('created_at DESC').paginate(page: params[:page], per_page: 5)
        @title = params[:category_id]
        #end
      elsif params[:favorites]
        @posts = Post.favorites(current_user).order('created_at DESC').paginate(page: params[:page], per_page: 5)
        @title = "Favorites"
      else
        @posts = Post.all.order('created_at DESC').paginate(page: params[:page], per_page: 5)
        @title = "General Newsfeed"
      end

    end

    def edit
        @post = Post.find(params[:id])
        if current_user.id != @post.user_id
          redirect_to posts_path
        end
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
      @post = Post.find(params[:id])
      if current_user.id != @post.user_id
          redirect_to '/'
      else
          Post.destroy(params[:id])
          redirect_to posts_path
      end
    end


    # def author
    #     @post.user = current_user.first_name
    # end    

      
    private
      	def post_params
      		  params.require(:post).permit(:user_id, :title, :description, :category, :price)
      	end
end
