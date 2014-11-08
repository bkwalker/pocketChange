class Location < ActiveRecord::Base

  # Remove item_id and user_id from this model, they are not necessary
  attr_accessible :description, :item_id, :name, :user_id

  # Relationships
  has_one :location_address
  has_many :items

  # Callbacks
  before_save :reformat_text

  # Scopes
  scope :alphabetical, order('name')

  # Lists

  # Validations
  # validates_numericality_of :item_id, :greater_than_or_equal_to => 1, :only_integer => true, :allow_nil => false
  validates_numericality_of :user_id, :greater_than_or_equal_to => 1, :only_integer => true, :allow_nil => false
  validates_presence_of :name, :description

  # Other methods

  # Private methods
  private

  def reformat_text
    self.name = self.name.downcase.squish.titleize unless self.name.nil?
  end

end
