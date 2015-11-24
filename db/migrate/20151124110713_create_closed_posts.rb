class CreateClosedPosts < ActiveRecord::Migration
  def change
    create_table :closed_posts do |t|
      t.string :title
      t.string :description
      t.string :category
      t.string :price
      t.integer :user_id
      t.string :image

      t.timestamps null: false
    end
  end
end
