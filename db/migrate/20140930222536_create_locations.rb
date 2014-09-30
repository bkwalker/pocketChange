class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.integer :user_id
      t.integer :item_id
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
