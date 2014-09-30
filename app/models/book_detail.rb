class BookDetail < ActiveRecord::Base
  attr_accessible :amazon_lowest_price, :authors, :course_number, :isbn, :item_id, :publication_year, :publisher
end
