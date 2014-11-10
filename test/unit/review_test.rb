require 'test_helper'

class ReviewTest < ActiveSupport::TestCase
  #Relationships
  should belong_to(:user)

  #Validations
  should validate_presence_of(:reviewer_id)
  should validate_presence_of(:user_id)
  should validate_presence_of(:rating)
  should validate_presence_of(:comments)

  #Validations for reviewer_id
  should allow_value(1).for(:reviewer_id)
  should allow_value(2).for(:reviewer_id)
  should allow_value(100).for(:reviewer_id)
  should allow_value(1000).for(:reviewer_id)

  should_not allow_value(0).for(:reviewer_id)
  should_not allow_value(-1).for(:reviewer_id)
  should_not allow_value(-2).for(:reviewer_id)
  should_not allow_value(-1000).for(:reviewer_id)
  should_not allow_value(10.7).for(:reviewer_id)

  #Validations for user_id
  should allow_value(1).for(:user_id)
  should allow_value(2).for(:user_id)
  should allow_value(100).for(:user_id)
  should allow_value(1000).for(:user_id)

  should_not allow_value(0).for(:user_id)
  should_not allow_value(-1).for(:user_id)
  should_not allow_value(-2).for(:user_id)
  should_not allow_value(-1000).for(:user_id)
  should_not allow_value(10.7).for(:user_id)

  #Validations for rating
  should allow_value(1).for(:rating)
  should allow_value(2).for(:rating)
	should allow_value(5).for(:rating)

  should_not allow_value(0).for(:rating)
  should_not allow_value(1.0).for(:rating)
  should_not allow_value(2.8).for(:rating)
  should_not allow_value(5.0).for(:rating)
  should_not allow_value(nil).for(:rating)

  #Validations for comments
  should allow_value("blah blah blah").for(:comments)
  should allow_value("You suck!").for(:comments)
  should allow_value("123 3jioh 389").for(:comments)

  should_not allow_value(nil).for(:comments)

end
