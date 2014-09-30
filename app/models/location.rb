class Location < ActiveRecord::Base
  attr_accessible :description, :item_id, :name, :user_id
end
