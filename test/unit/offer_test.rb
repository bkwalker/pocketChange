require 'test_helper'

class OfferTest < ActiveSupport::TestCase
  #Relationships
  should belong_to(:item)
  should belong_to(:user)

  #Validations
  should validate_presence_of(:user_id)
  should validate_presence_of(:active)
  should validate_presence_of(:amount)
  should validate_presence_of(:active)

  #Validations for amount
  should allow_value(1).for(:amount)
  should allow_value(1.0).for(:amount)
  should allow_value(2.99).for(:amount)
  should allow_value(10000).for(:amount)
  
  should_not allow_value(nil).for(:amount)
  should_not allow_value(2.999999).for(:amount)
  should_not allow_value(-1).for(:amount)
  should_not allow_value(-99.7).for(:amount)
  should_not allow_value("blah blah").for(:amount)
  should_not allow_value("").for(:amount)

  #Validations for pickup_time
  should allow_value(DateTime.current).for(:pickup_time)
  should allow_value(nil).for(:pickup_time)
  #should allow_valuce().for(:pickup_time)
  #should allow_value().for(:pickup_time)
  

  #should_not allow_value().for(:pickup_time)
  should_not allow_value(0).for(:pickup_time)
  should_not allow_value("hublah").for(:pickup_time)
  should_not allow_value(1.1).for(:pickup_time)

  #Validations for accepted
  should allow_value(true).for(:accepted)
  should allow_value(false).for(:accepted)

  should_not allow_value(nil).for(:accepted)
  should_not allow_value("").for(:accepted)
  should_not allow_value(1.0).for(:accepted)
  should_not allow_value(0).for(:accepted)

  #Validations for active
  should allow_value(true).for(:active)
  should allow_value(false).for(:active)

  should_not allow_value(nil).for(:active)
  should_not allow_value("").for(:active)
  should_not allow_value(1.0).for(:active)
  should_not allow_value(0).for(:active)

end
