class Availability < ActiveRecord::Base
  attr_accessible :end_time, :location_id, :start_time
end
