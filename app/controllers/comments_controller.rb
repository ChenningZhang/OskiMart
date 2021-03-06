class CommentsController < ApplicationController
	before_action :authenticate_user!

	def new
        @comment = Comment.new
    end

	def create
	  @comment = Comment.new(comment_params)
    @post = Post.find(params[:post_id])
	  @comment.user_id = current_user.id
	  @comment.post_id = @post.id
	  current_user.comments << @comment
	  @post.comments << @comment

    if @comment.save
  	  redirect_to comments_path(:post_id => @post.id)
    else
      render 'new'
    end
	end

    def index
      if Post.where(:id => params[:post_id]).empty?
          redirect_to posts_path
      else
          @comments = Comment.all.where(:post_id => params[:post_id])
      end
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
