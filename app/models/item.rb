class Item < ActiveRecord::Base
  attr_accessible :user_id, :location_id, :picture_cache, :active, :condition, :description, :name, :picture, :price, :price_negotiable, :sold, :tag

  mount_uploader :picture, AvatarUploader

  belongs_to :user
  belongs_to :location
  has_many :offers
  has_one :book_detail

  validates_presence_of :name, :description, :picture, :condition, :user_id, :price, :tag

  CONDITION = [["New", 0], ["Like New", 1], ["Good", 2], ["Fair", 3], ["Poor", 4]] 

  validates :price, :numericality => { :greater_than => 0 }
  validates_format_of :price, :with => /\A\d+(?:\.\d{0,2})?\z/
  validates :price_negotiable, :inclusion => {:in => [true, false]}
  validates_inclusion_of :sold, :in => [true, false]
  validates_inclusion_of :active, :in => [true, false]
  validates_inclusion_of :price_negotiable, :in => [true, false]


  scope :alphabetical, -> { order('name') }
  scope :active, -> { where(active: true) }  
  scope :avaliable, -> { where(sold: true) }
  scope :sold, -> { where(sold: false) }
  scope :price_ceiling, -> { where('price <= ?', price) }






end
