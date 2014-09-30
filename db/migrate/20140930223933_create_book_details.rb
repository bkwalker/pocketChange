class CreateBookDetails < ActiveRecord::Migration
  def change
    create_table :book_details do |t|
      t.integer :item_id
      t.text :authors
      t.string :course_number
      t.string :isbn
      t.integer :publication_year
      t.string :publisher
      t.decimal :amazon_lowest_price

      t.timestamps
    end
  end
end
