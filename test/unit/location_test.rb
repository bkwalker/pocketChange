require 'test_helper'

class LocationTest < ActiveSupport::TestCase
	
	#Relationship Tests
	should have_one(:location_address)

	# tests for name
	should validate_presence_of(:name)

	# tests for description
	should validate_presence_of(:description)

	should allow_value("blah blah").for(:name)
	should allow_value("can't stop won't stop").for(:name)

	should_not allow_value(nil).for(:name)

	should allow_value("blah blah").for(:description)
	should allow_value("can't stop won't stop").for(:description)

	should_not allow_value(nil).for(:description)
end
