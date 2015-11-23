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
    byebug

    if @parsed_body["error"].nil?
      current_user.access_token = @parsed_body["access_token"] 
      current_user.venmo_id = @parsed_body["user"]["id"]
      render 'users/venmo_show'
    else
      flash[:notice] = "Denied Venmo Access!"
      current_user.access_token = nil
      current_user.venmo_id = nil
      redirect_to user_path(current_user.id)
    end
    current_user.save

  end

  def payment
      @user = Venmo.authenticate params[:code]
      if @user
        @info = @user.get_info
        @friends = @user.get_friends
        @other_user = @user.get_user 145434160922624933
        @other_user_client = Venmo.get_user 145434160922624933, @user.access_token

        @payment = @user.make_payment ({ :note => 'A message to accompany the payment.', :amount => '0.10', :user_id => 145434160922624933 })

        @payment2 = @user.get_payment 1513344862190043372
        @payment2_client = Venmo.get_payment 1513344862190043372, @user.access_token

        @recent_payments = @user.get_recent_payments
        @recent_payments_client = Venmo.get_recent_payments @user.access_token
      end
    end
end