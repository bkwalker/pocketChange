class BookDetail < ActiveRecord::Base
  attr_accessible :item_id, :amazon_lowest_price, :authors, :course_number, :isbn, :publication_year, :publisher

  belongs_to :item

  validates_presence_of :authors, :publication_year, :item_id
  
  validates :item_id, :numericality => { only_integer: true, :greater_than => 0 }
  validates :publication_year, :numericality => { only_integer: true, :greater_than => 1600, :less_than_or_equal_to => Time.now.year }
  validates :amazon_lowest_price, :numericality => { :greater_than => 0 }
  validates_format_of :amazon_lowest_price, :with => /\A\d+(?:\.\d{0,2})?\z/

  def comparison
  	item = Item.find_by_id(self.item_id)
  	return item.price <= amazon_lowest_price
  end


end
