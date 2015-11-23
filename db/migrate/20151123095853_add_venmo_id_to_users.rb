class AddVenmoIdToUsers < ActiveRecord::Migration
  def change
  	  	add_column :users, :venmo_id, :string

  end
end
