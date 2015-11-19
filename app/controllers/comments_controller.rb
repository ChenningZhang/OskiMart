class CommentsController < ApplicationController
	before_action :authenticate_user!

	def new
        @comment = Comment.new
    end

	def create
	   @post = Post.find(params[:post_id])
	   @comment = Comment.new(comment_params)
	   @comment.user_id = current_user.id
	   @comment.post_id = @post.id
	   current_user.comments << @comment
	   @post.comments << @comment

	   if @comment.save
		  flash[:success] = "Your comment has been posted!"
		  redirect_to comments_path(:post_id => @post.id)
        else
          render 'new'
        end
	end

	def show
        @comment = Comment.find(params[:id])
    end

    def index
    	@comments = Comment.all.where(:post_id => params[:post_id])
    end

    def edit
        @comment = Comment.find(params[:id])
        if current_user.id != @comment.user_id
          redirect_to comments_path(:post_id => @comment.post_id)
        end
    end

    def update
        @comment = Comment.find(params[:id])
        @post = Post.find(@comment.post_id)
        if @comment.update_attributes(comment_params)
          flash[:success] = "Your comment has been updated!"
          redirect_to comments_path(:post_id => @post.id)
        else
          render 'edit'
        end
    end

    def destroy
      @comment = Comment.find(params[:id])
      if current_user.id != @comment.user_id
          redirect_to comments_path(:post_id => @comment.post_id)
      else
          Comment.destroy(params[:id])
          redirect_to comments_path(:post_id => @comment.post_id)
      end
    end

    private
      	def comment_params
      		  params.require(:comment).permit(:user_id, :post_id, :text)
      	end
    
end
