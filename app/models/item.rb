class Item < ActiveRecord::Base
  attr_accessible :user_id, :location_id, :active, :condition, :description, :name, :picture, :price, :price_negotiable, :sold, :tag

  belongs_to :user
  belongs_to :location
  has_many :offers
  has_one :book_detail

  validates_presence_of :name, :description, :picture, :condition, :tag
  validates :price, :numericality => { :greater_than => 0 }
  validates_format_of :price, :with => /\A\d+(?:\.\d{0,2})?\z/
  validates :price_negotiable, :inclusion => {:in => [true, false]}
  validates :sold, :inclusion => {:in => [true, false]}
  validates :active, :inclusion => {:in => [true, false]}

  scope :alphabetical, -> { order('name') }
  scope :active, -> { where(active: true) }  
  scope :avaliable, -> { where(sold: false) }
  scope :sold, -> { where(sold: false) }
  scope :price_ceiling, -> { where('price = ?', price) }





end
