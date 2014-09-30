class CreateConversations < ActiveRecord::Migration
  def change
    create_table :conversations do |t|
      t.integer :item_id
      t.integer :buyer_id

      t.timestamps
    end
  end
end
