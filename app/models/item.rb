class Item < ActiveRecord::Base
  attr_accessible :user_id, :location_id, :picture_cache, :active, :condition, :description, :name, :picture, :price, :price_negotiable, :sold, :tag

  mount_uploader :picture, AvatarUploader

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

end
