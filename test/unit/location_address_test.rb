require 'test_helper'

class LocationAddressTest < ActiveSupport::TestCase

	#Relationship Tests
	should belong_to(:location)

	# tests for street
	should validate_presence_of(:street)

	# tests for city
	should validate_presence_of(:city)  

	# tests for zip
	should allow_value("15213").for(:zip)
	should_not allow_value(nil).for(:zip)
	should_not allow_value("bad").for(:zip)
	should_not allow_value("1512").for(:zip)
	should_not allow_value("152134").for(:zip)
	should allow_value("15213-0983").for(:zip)

	# tests for state
	should allow_value("OH").for(:state)
	should allow_value("PA").for(:state)
	should allow_value("WV").for(:state)
	should allow_value("NY").for(:state)
	should allow_value("CA").for(:state)	
	should_not allow_value("bad").for(:state)
	should_not allow_value(10).for(:state)

	#test location_id
	should validate_numericality_of(:location_id)
	should allow_value(3).for(:location_id)
	should_not allow_value(3.14159).for(:location_id)
	should_not allow_value(0).for(:location_id)
	should_not allow_value(-1).for(:location_id)
	should_not allow_value(nil).for(:location_id)

end
