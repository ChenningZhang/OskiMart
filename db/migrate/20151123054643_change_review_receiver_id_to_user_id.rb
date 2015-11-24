class ChangeReviewReceiverIdToUserId < ActiveRecord::Migration
  def change
  	remove_column :reviews, :receiver_id
  	add_column :reviews, :user_id, :integer
  end
end
