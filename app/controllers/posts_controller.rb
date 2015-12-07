class PostsController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :verify_authenticity_token

    def new
        @post = Post.new
    end

    def favorite
      @post = Post.find(params[:post_id])
      # if post in favorite list then remove 
      if current_user.favorites.include?(@post)
        current_user.favorites.delete(@post)
        render json: {favorited: false}
      # add to fav list
      else
        current_user.favorites << @post
        render json: {favorited: true}
      end
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
      else
        @posts = Post.all.order('created_at DESC').paginate(page: params[:page], per_page: 5)
        @title = "General"
      end

      if params[:price] #if filter
        if params[:keywords]
          @posts = Post.search(params[:keywords], params[:category_id], params[:price]).order("created_at DESC").paginate(page: params[:page], per_page: 5)
        else
          @posts = Post.filter(params[:price], params[:category_id]).order("created_at DESC").paginate(page: params[:page], per_page: 5)
        end
        @title += ", Price = " + params[:price]
      end 

      if params[:keywords] #if search
        @posts = Post.search(params[:keywords], params[:category_id], params[:price]).order("created_at DESC").paginate(page: params[:page], per_page: 5)
        @title += ", Search = " + params[:keywords]
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
          redirect_to comments_path(:post_id => @post.id)
        else
          render 'edit'
        end
    end

    def destroy
      @post = Post.find(params[:id])
      if current_user.id != @post.user_id
          redirect_to posts_path
      else
          @closed_post = ClosedPost.create(:user_id => current_user.id, :title => @post.title, :description => @post.description, :category => @post.category, :price => @post.price, :image => @post.image)
          current_user.closed_posts << @closed_post
          Post.destroy(params[:id])
          redirect_to posts_path
      end
    end

    private
      	def post_params
      		  params.require(:post).permit(:user_id, :title, :description, :category, :price, :image, :remote_image_url)
      	end
end
