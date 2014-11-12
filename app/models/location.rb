class Location < ActiveRecord::Base
  # Remove item_id and user_id from this model, they are not necessary
  attr_accessible :description, :name

  # Relationships
  has_one :location_address
  has_many :items

  # Callbacks
  before_save :reformat_text

  # Scopes
  scope :alphabetical, order('name')

  # Lists

  # Validations
  validates_presence_of :name, :description

  # Other methods

  # Private methods
  private

  def reformat_text
    self.name = self.name.downcase.squish.titleize unless self.name.nil?
  end

end
