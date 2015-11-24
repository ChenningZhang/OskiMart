class PostsController < ApplicationController
  before_action :authenticate_user!

    def new
        @post = Post.new
    end

    # def back
    #   redirect_to :back
    # rescue ActionController::RedirectBackError
    #   redirect_to root_path
    # end

    # favorite a post method
    def favorite
      @post = Post.find(params[:post_id])
      # if post in favorite list then remove 
      if current_user.favorites.include?(@post)
        current_user.favorites.delete(@post)
      # add to fav list
      else
        current_user.favorites << @post
      end

      redirect_to :back  
    end

    def fav_index
      @posts = current_user.favorites
      render 'favorites'
    end

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
      if not params[:category_id].nil? and not params[:category_id].empty? 
        @posts = Post.where(:category => params[:category_id]).order('created_at DESC').paginate(page: params[:page], per_page: 5)
        @title =  params[:category_id]
        #puts "first if"
      else
        @posts = Post.all.order('created_at DESC').paginate(page: params[:page], per_page: 5)
        @title = "General"
        puts "else"
      end

      if params[:price] #if filter
        @posts = Post.filter(params[:price], params[:category_id]).order("created_at DESC").paginate(page: params[:page], per_page: 5)
        @title += ", Price = " + params[:price] 
      end 

      if params[:keywords] #if search
        #puts params[:keywords] 
        #puts params[:category_id]
        @posts = Post.search(params[:keywords], params[:category_id]).order("created_at DESC").paginate(page: params[:page], per_page: 5)
        @title += ", Search = " + params[:keywords]
        #if @posts.empty?
          #render "posts/index", :locals=> {:search_err => 'No search results returned'}

      end

        if params[:favorites]
          @posts = Post.favorites(current_user).order('created_at DESC').paginate(page: params[:page], per_page: 5)
          @title = "Favorites"
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
      		  params.require(:post).permit(:user_id, :title, :description, :category, :price, :image)
      	end
end
