class Item < ActiveRecord::Base
  attr_accessible :user_id, :location_id, :picture_cache, :active, :condition, :description, :name, :picture, :price, :price_negotiable, :sold, :tag

  mount_uploader :picture, AvatarUploader

  filterrific(
  default_settings: { sorted_by: 'created_at_desc' },
  filter_names: [
    :sorted_by
    ]
  )

  def self.options_for_sorted_by
  [
    ['Most Recent', 'created_at_asc'],
    ['Price (Low to High)', 'price_asc'],
    ['Price (High to Low', 'price_desc'],
    ['Condition', 'condition_asc']
  ]
  end

  belongs_to :user
  belongs_to :location
  has_many :offers
  has_one :book_detail

  validates_presence_of :name, :description, :picture, :condition, :user_id, :price, :tag

  CONDITION = [["New", 0], ["Like New", 1], ["Good", 2], ["Fair", 3], ["Poor", 4]] 

  validates :user_id, :numericality => { only_integer: true, :greater_than => 0 }
  validates_numericality_of :location_id, :allow_nil => true, :only_integer => true, :greater_than => 0
  validates :price, :numericality => { :greater_than => 0 }
  validates_format_of :price, :with => /\A\d+(?:\.\d{0,2})?\z/
  validates :price_negotiable, :inclusion => {:in => [true, false]}
  validates_inclusion_of :sold, :in => [true, false]
  validates_inclusion_of :active, :in => [true, false]
  validates_inclusion_of :price_negotiable, :in => [true, false]


  scope :alphabetical, -> { order('name') }
  scope :active, -> { where(active: true) }  
  scope :available, -> { where(sold: true) }
  scope :sold, -> { where(sold: false) }
  scope :price_ceiling, -> { where('price <= ?', price) }

  scope :sorted_by, lambda { |sort_option|
  direction = (sort_option =~ /desc$/) ? 'desc' : 'asc'
  case sort_option.to_s
    when /^created_at_/
      order("items.created_at #{ direction }")
    when /^price_/
      order("items.price #{ direction }")
    when /^condition_/
      order("items.condition #{ direction }")
    else
      raise(ArgumentError, "Invalid sort option: #{ sort_option.inspect }")
  end
  }

  def condition_name
    condition = self.condition
    if condition == "0"
      return "New"
    elsif condition == "1"
      return "Like New"
    elsif condition == "2"
      return "Good"
    elsif condition == "3"
      return "Fair"
    elsif condition == "4"
      return "poor"    
    end
  end




#oldest to newest and backwards
#low to high and high to low pricewise
#filter by tag
#
end
