class VenmoController < ApplicationController
  before_action :authenticate_user!

  def callback
    #make server side post request
    require 'net/http'
    require 'uri'
    url = URI.parse('https://api.venmo.com/v1/oauth/access_token')
    post_args = { 'client_id' => 3195, 'client_secret' => 'bKRVaunyQhQQAH7UzRDMbf9Qc2bARdAQ', 'code' => params[:code]}
    response = Net::HTTP.post_form(url, post_args)
    @parsed_body = JSON.parse(response.body)
    
    if @parsed_body["error"].nil?
      current_user.access_token = @parsed_body["access_token"] 
      current_user.venmo_id = @parsed_body["user"]["id"]
      flash[:success] = 'Allowed Venmo Access!'
      current_user.save
      redirect_to user_path(current_user.id)
    else
      flash[:danger] = "Denied Venmo Access!"
      current_user.access_token = nil
      current_user.venmo_id = nil
      current_user.save
      redirect_to user_path(current_user.id)
    end

  end

  def initialize_payment
      @venmo_receiver = User.find(params[:receiver])
      # @venmo_user = Venmo.authenticate params[:code]
      if @venmo_receiver.venmo_id.nil?
        flash[:warning] = 'This person does not have Venmo!'
        redirect_to :back
      else
        render 'venmo/show'        
      end
    end

  def final_payment
    if params[:amount].nil? or params[:amount].empty? or params[:description].nil? or params[:description].empty? or params[:amount].to_f < 0
      flash[:danger] = "Amount/description were not filled in properly"
      redirect_to :back
    else
      if not params[:charge].nil?
        amount = '-' + params[:amount]
      else
        amount = params[:amount]
      end
      require 'net/http'
      require 'uri'
      url = URI.parse('https://api.venmo.com/v1/payments')
      post_args = { 'access_token' => current_user.access_token, 'user_id' => User.find(params[:receiver]).venmo_id, 'note' => params[:description], 'amount' => amount}
      response = Net::HTTP.post_form(url, post_args)
      @parsed_body = JSON.parse(response.body)
      if @parsed_body["error"].nil?
        if not params[:charge].nil?
          flash[:success] = "Charge successful!"
        else
          flash[:success] = "Payment successful!"
        end
        redirect_to user_path(params[:receiver])
      else
        flash[:danger] = @parsed_body["error"]["message"]
        redirect_to user_path(params[:receiver])
      end
    end
  end
end