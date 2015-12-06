class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  add_flash_types :success, :warning, :danger, :info

  include Pundit

  protect_from_forgery with: :exception

  #rescue_from ActiveRecord::RecordNotFound do
  #  flash[:warning] = 'Resource not found'
  #  redirect_back_or root_path
  #end

  def redirect_back_or(path)
    redirect_to request.referer || path
  end

  # Devise stuff
  include SessionsHelper

  def after_sign_in_path_for(resource)
    #user_path(current_user)
    posts_path
  end

  def after_sign_up_path_for(resource)
    root_path
  end

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:email, :password)}
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:first_name, :last_name, :email, :password, :password_confirmation)}
    devise_parameter_sanitizer.for(:account_update) << :first_name
    devise_parameter_sanitizer.for(:account_update) << :last_name
  end




end
