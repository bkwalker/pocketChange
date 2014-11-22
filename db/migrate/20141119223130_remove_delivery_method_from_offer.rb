class RemoveDeliveryMethodFromOffer < ActiveRecord::Migration
  def up
    remove_column :offers, :delivery_method
  end

  def down
    add_column :offers, :delivery_method, :string
  end
end
