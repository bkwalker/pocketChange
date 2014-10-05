class Availability < ActiveRecord::Base
  attr_accessible :end_time, :location_id, :start_time

  has_many :locations

  validates_presence_of :end_time, :location_id, :start_time

  
  

end
