class Item < ActiveRecord::Base
  attr_accessible :active, :condition, :description, :location_id, :name, :picture, :price, :price_negotiable, :sold, :tag, :user_id

  belongs_to :user
  belongs_to :location
  has_many :offers
  has_one :book_detail

end
