class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :user_id
      t.integer :reviewer_id
      t.text :comments
      t.integer :rating

      t.timestamps
    end
  end
end
