class ChangePriceTypeInPosts < ActiveRecord::Migration
  def change
    change_column :posts, :price, :string
  end
end
