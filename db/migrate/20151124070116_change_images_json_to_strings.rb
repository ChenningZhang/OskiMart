class ChangeImagesJsonToStrings < ActiveRecord::Migration
  def change
  	remove_column :posts, :images
  	add_column :posts, :images, :string
  end
end
