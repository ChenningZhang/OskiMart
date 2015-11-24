class ChangeImgaesStringToJson < ActiveRecord::Migration
  def change
  	remove_column :posts, :images
  	add_column :posts, :images, :json
  end
end
