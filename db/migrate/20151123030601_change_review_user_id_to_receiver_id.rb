class ChangeReviewUserIdToReceiverId < ActiveRecord::Migration
  def change
  	remove_column :reviews, :user_id
  	add_column :reviews, :receiver_id, :integer
  end
end
