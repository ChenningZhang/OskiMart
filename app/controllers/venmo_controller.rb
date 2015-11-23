class VenmoController < ApplicationController
  before_action :authenticate_user!

  def callback
    # now, do the dirty work
    require 'net/http'
    require 'uri'
    # get the url that we need to post to
    url = URI.parse('https://api.venmo.com/v1/oauth/access_token')
    # build the params string
    post_args = { 'client_id' => 3195, 'client_secret' => 'bKRVaunyQhQQAH7UzRDMbf9Qc2bARdAQ', 'code' => params[:code]}
    # send the request
    response = Net::HTTP.post_form(url, post_args)
    @parsed_body = JSON.parse(response.body)
    
    if @parsed_body["error"].nil?
      current_user.access_token = @parsed_body["access_token"] 
      current_user.venmo_id = @parsed_body["user"]["id"]
      # @user = User.find(current_user.id)
      # @user.access_token = @parsed_body["access_token"] 
      # @user.venmo_id = @parsed_body["user"]["id"]
      # @user.save
      current_user.save
      redirect_to user_path(current_user.id)
    else
      flash[:notice] = "Denied Venmo Access!"
      current_user.access_token = nil
      current_user.venmo_id = nil
      redirect_to user_path(current_user.id)
    end

  end

  def initialize_payment
      @venmo_receiver = User.find(:id => params[:receiver])
      # @venmo_user = Venmo.authenticate params[:code]
      if @venmo_receiver.venmo_id.nil?
        flash[:notice] = 'This person does not have Venmo!'
        redirect :back
      else
        render 'users/venmo_show'        
      end
    end

  def final_payment
    # @payment = current_user.make_payment ({ :note => 'A message to accompany the payment.', :amount => '0.10', :user_id => 145434160922624933 })

    #     @payment2 = @user.get_payment 1513344862190043372
    #     @payment2_client = Venmo.get_payment 1513344862190043372, @user.access_token

    #     @recent_payments = @user.get_recent_payments
    #     @recent_payments_client = Venmo.get_recent_payments @user.access_token
    # Inputs are amount, message, id of paid_to (implicit)
  end


end