class AddDeliveryMethodToItem < ActiveRecord::Migration
  def change
    add_column :items, :delivery_method, :integer
  end
end
