class ChangeImagesToImage < ActiveRecord::Migration
  def change
  	remove_column :posts, :images
  	add_column :posts, :image, :string
  end
end
