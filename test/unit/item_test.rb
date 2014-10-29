require 'test_helper'

class ItemTest < ActiveSupport::TestCase
  should belong_to(:user)
  should belong_to(:location)
  should have_many(:offers)
  should have_one(:book_detail)

  # Validating price...
  should allow_value(365).for(:price)
  should allow_value(1.5).for(:price)
  should allow_value(0.75).for(:price)
  
  should_not allow_value("bad").for(:price)
  should_not allow_value(0).for(:price)
  should_not allow_value(-365).for(:price)
  should_not allow_value(1.777).for(:price)

  # Validation macros...
  should validate_presence_of(:name)
  should validate_presence_of(:description)
  should validate_presence_of(:picture)
  should validate_presence_of(:condition)
  should validate_presence_of(:tag)
  should validate_presence_of(:user_id)

  #Validating Price Negotiable
  should allow_value(true).for(:price_negotiable)
  should allow_value(false).for(:price_negotiable)

  should_not allow_value(nil).for(:price_negotiable)
  # should_not allow_value(123).for(:price_negotiable)
  # should_not allow_value("bad").for(:price_negotiable)

  #Validating Sold
  should allow_value(true).for(:sold)
  should allow_value(false).for(:sold)

  should_not allow_value(nil).for(:sold)
  
  #Validating active
  should allow_value(true).for(:active)
  should allow_value(false).for(:active)

  should_not allow_value(nil).for(:active)

  # context "Given context" do
  #   # create the objects I want with factories
  #   setup do 
  #     @ipad = FactoryGirl.create(:item, name: "Ipad")

  #   end
    
  #   # and provide a teardown method as well
  #   teardown do
  #     @ipad.destroy
  #   end
  
  #   # now run the tests:
  #   # test one of each factory (not really required, but not a bad idea)
  #   should "show that cat, owner, pet, vaccine, visit is created properly" do
  #     assert_equal "Alex", @alex.first_name
  #     assert_equal "Cat", @cat.name
  #     assert_equal "Dusty", @dusty.name
  #     assert_equal "Rabies", @rabies.name
  #     assert_equal 5, @visit1.weight
  #     assert_equal "250 ml", @vacc1.dosage
  #   end
    
  #   # test the named scope 'chronological'
  #   should "list vaccinations in chronological order" do
  #     assert_equal 5, Vaccination.chronological.size # quick check of size
  #     dates = Array.new
  #     # get array of visit dates in order
  #     [2,3,5,5,6].sort.each {|n| dates << n.months.ago.to_date}
  #     assert_equal dates, Vaccination.chronological.map{|v| v.visit.date}
  #   end
    
    


end
