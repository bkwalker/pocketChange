class LocationAddress < ActiveRecord::Base
  attr_accessible :city, :location_id, :state, :street, :zip
end
