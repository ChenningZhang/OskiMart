class PostsController < ApplicationController
  def create
  	@post = Post.new
  end

  def index
  	@user = Post.find(params[:id])
  end

  def update
  	
  end

  def delete
  end

  private
  	def user_params
  		params.require(:post).permit(:title, :description, :category, :price)
  	end

end
