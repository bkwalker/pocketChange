require 'test_helper'

class BookDetailTest < ActiveSupport::TestCase
  
  should belong_to(:item)
  
  #Validating Micros
  should validate_presence_of(:authors)
  should validate_presence_of(:course_number)
  should validate_presence_of(:isbn)
  should validate_presence_of(:publication_year)
  should validate_presence_of(:publisher)

   # Validating price...
  should allow_value(365).for(:amazon_lowest_price)
  should allow_value(1.5).for(:amazon_lowest_price)
  should allow_value(0.75).for(:amazon_lowest_price)
  
  should_not allow_value("bad").for(:amazon_lowest_price)
  should_not allow_value(0).for(:amazon_lowest_price)
  should_not allow_value(-365).for(:amazon_lowest_price)
  should_not allow_value(1.777).for(:amazon_lowest_price)

  #Validating publication year
  should allow_value(2011).for(:publication_year)
  should allow_value(1945).for(:publication_year)
  should allow_value(2014).for(:publication_year)
  
  should_not allow_value("bad").for(:publication_year)
  should_not allow_value(0).for(:publication_year)
  should_not allow_value(-365).for(:publication_year)
  should_not allow_value(1.777).for(:publication_year)
  should_not allow_value(2015).for(:publication_year)
  should_not allow_value(1492).for(:publication_year)
  should_not allow_value(22).for(:publication_year)
  should_not allow_value(3000).for(:publication_year)

end
