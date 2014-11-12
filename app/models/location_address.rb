class LocationAddress < ActiveRecord::Base
  attr_accessible :city, :location_id, :state, :street, :zip

  # Relationships
  belongs_to :location

  # Callbacks
  before_save :reformat_text

  # Scopes
  scope :alphabetical, order('name')

  # Lists
  STATES_LIST = [['Alabama', 'AL'],['Alaska', 'AK'],['Arizona', 'AZ'],
                ['Arkansas', 'AR'],['California', 'CA'],['Colorado', 'CO'],
                ['Connectict', 'CT'],['Delaware', 'DE'],['District of Columbia ', 'DC'],
                ['Florida', 'FL'],['Georgia', 'GA'],['Hawaii', 'HI'],['Idaho', 'ID'],
                ['Illinois', 'IL'],['Indiana', 'IN'],['Iowa', 'IA'],['Kansas', 'KS'],
                ['Kentucky', 'KY'],['Louisiana', 'LA'],['Maine', 'ME'],['Maryland', 'MD'],
                ['Massachusetts', 'MA'],['Michigan', 'MI'],['Minnesota', 'MN'],
                ['Mississippi', 'MS'],['Missouri', 'MO'],['Montana', 'MT'],
                ['Nebraska', 'NE'],['Nevada', 'NV'],['New Hampshire', 'NH'],
                ['New Jersey', 'NJ'],['New Mexico', 'NM'],['New York', 'NY'],
                ['North Carolina','NC'],['North Dakota', 'ND'],['Ohio', 'OH'],
                ['Oklahoma', 'OK'],['Oregon', 'OR'],['Pennsylvania', 'PA'],
                ['Rhode Island', 'RI'],['South Carolina', 'SC'],['South Dakota', 'SD'],
                ['Tennessee', 'TN'],['Texas', 'TX'],['Utah', 'UT'],['Vermont', 'VT'],
                ['Virginia', 'VA'],['Washington', 'WA'],['West Virginia', 'WV'],
                ['Wisconsin ', 'WI'],['Wyoming', 'WY']]

  # Validations
  validates_presence_of :street, :city
  validates_inclusion_of :state, :in => STATES_LIST.map {|k, v| v}, :message => "Not a recognized State"
  validates_format_of :zip, :with => /^\d{5}$/, :message => "Should be five digits long"
  validates_numericality_of :location_id, :greater_than_or_equal_to => 1, :only_integer => true, :allow_nil => false

  # Other methods
  def full_address
  "#{street}, #{city}, #{state} #{zip}"
  end

  # Private methods
  private

  def reformat_text
    self.street = self.street.downcase.squish.titleize unless self.street.nil?
    self.city = self.city.downcase.squish.titleize unless self.city.nil?    
  end

end
