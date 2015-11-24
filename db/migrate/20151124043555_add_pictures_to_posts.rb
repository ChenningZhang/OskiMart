class AddPicturesToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :images, :json
  end
end
