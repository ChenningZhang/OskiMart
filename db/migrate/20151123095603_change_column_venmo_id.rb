class ChangeColumnVenmoId < ActiveRecord::Migration
  def self.up
  	remove_column :users, :venmo_id
  end


  def self.down
  	add_column :users, :venmo_id, :string
  end
end
