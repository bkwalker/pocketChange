class CreateOffers < ActiveRecord::Migration
  def change
    create_table :offers do |t|
      t.integer :item_id
      t.integer :user_id
      t.decimal :amount
      t.decimal :counter_amount
      t.string :payment_method
      t.datetime :pickup_time
      t.string :delivery_method
      t.boolean :accepted
      t.boolean :active

      t.timestamps
    end
  end
end
