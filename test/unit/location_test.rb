require 'test_helper'

class LocationTest < ActiveSupport::TestCase
	
	#Relationship Tests
	should have_on(:location_address)

	# tests for name
	should validate_presence_of(:name)

	# tests for description
	should validate_presence_of(:description)  

	#test item_id
	should validate_numericality_of(:item_id)
	should allow_value(3).for(:item_id)
	should_not allow_value(3.14159).for(:item_id)
	should_not allow_value(0).for(:item_id)
	should_not allow_value(-1).for(:item_id)
	should_not allow_value(nil).for(:item_id)

	#test user_id
	should validate_numericality_of(:user_id)
	should allow_value(3).for(:user_id)
	should_not allow_value(3.14159).for(:user_id)
	should_not allow_value(0).for(:user_id)
	should_not allow_value(-1).for(:user_id)
	should_not allow_value(nil).for(:user_id)

end
