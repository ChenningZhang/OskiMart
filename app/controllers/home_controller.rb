class HomeController < ApplicationController
  def home
    if user_signed_in?
      redirect_to posts_path
    end
    puts current_user
  end

  def login
  end

  def signup
  end
end
