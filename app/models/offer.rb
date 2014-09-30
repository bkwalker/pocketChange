class Offer < ActiveRecord::Base
  attr_accessible :accepted, :active, :amount, :counter_amount, :delivery_method, :item_id, :payment_method, :pickup_time, :user_id
end
