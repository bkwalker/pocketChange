class CreateLocationAddresses < ActiveRecord::Migration
  def change
    create_table :location_addresses do |t|
      t.string :street
      t.integer :zip
      t.string :city
      t.string :state
      t.integer :location_id

      t.timestamps
    end
  end
end
