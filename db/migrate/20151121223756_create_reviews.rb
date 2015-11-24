class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :score
      t.string :feedback
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
