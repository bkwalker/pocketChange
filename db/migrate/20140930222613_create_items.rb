class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer :user_id
      t.integer :location_id
      t.string :name
      t.text :description
      t.decimal :price
      t.string :picture
      t.boolean :price_negotiable
      t.string :condition
      t.boolean :sold
      t.text :tag
      t.boolean :active

      t.timestamps
    end
  end
end
