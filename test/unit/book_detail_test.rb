require 'test_helper'

class BookDetailTest < ActiveSupport::TestCase
  
  should belong_to(:item)
  
  #Validating Micros
  should validate_presence_of(:authors)
  should validate_presence_of(:publication_year)
  should validate_presence_of(:item_id)

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

  context "Given context" do
    # create the objects I want with factories
    setup do   
      @shaun = FactoryGirl.create(:user, first_name: "Shaun", last_name: "Sophie")
      @harryPotter = FactoryGirl.create(:item, name: "HP4", description: "ABC", picture: "A", condition: "good", user: @shaun, price: 44.30, sold: true, price_negotiable: false)
      @book1 = FactoryGirl.create(:book_detail, name: "Deathly Hallows", authors: "JK Rowling", publication_year: 2009, item: @HarryPotter, amazon_lowest_price: 34.00)
    end
    
    # and provide a teardown method as well
    teardown do
      @shaun.destroy
      @harryPotter.destroy
      @book1.destroy
    end

    should "shows that comparison method works" do
      assert_equal true, @book1.comparison
    end
  end
end
