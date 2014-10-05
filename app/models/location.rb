class Location < ActiveRecord::Base
  attr_accessible :description, :item_id, :name, :user_id

  # Relationships
  has_one :location_address

  # Callbacks
  before_save :reformat_text

  # Scopes
  scope :alphabetical, order('name')

  # Lists

  # Validations
  validates_numericality_of :item_id, :user_id
  validates_presence_of :name, :description

  # Other methods

  # Private methods
  private

  def reformat_text
    self.name = self.name.downcase.squish.titleize unless self.name.nil?
  end

end
