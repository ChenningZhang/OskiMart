class VenmoController < ApplicationController
  before_action :authenticate_user!

  def index
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