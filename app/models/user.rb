class User < ActiveRecord::Base
  has_secure_password

  attr_accessible :active, :email, :first_name, :last_name, :password, :password_confirmation, :picture, :rating, :gender, :dob

  # Relationships
  has_many :items
  has_many :reviews
  has_many :locations

  # Callbacks
  # before_save :reformat_text
  # before_save :reformat_email

  # Scopes
  scope :alphabetical, order('last_name, first_name')

  # Lists
  
  # for use in authorizing with CanCan
  ROLES = [['Administrator', :admin], ['Member', :member]]

  # Validations
  validates_presence_of :first_name, :last_name
  # validates_date :dob, :on_or_before => lambda { Date.new(13.years.ago) }, :message => "You must be older than 13 to use this application."
  # validates_format_of :email, :with => /^[\w]([^@\s,;]+)@(([\w-]+\.)+(andrew.cmu.edu))$/i, :message => "Valid CMU ID Required", :allow_blank => false
  validates_uniqueness_of :email, :case_sensitive => false, :allow_blank => false
  validates_numericality_of :rating
  validates_inclusion_of :gender, :in => [true, false]
  validates_inclusion_of :active, :in => [true, false]

  # Other methods
  def name
    "#{last_name}, #{first_name}"
  end
  
  def proper_name
    "#{first_name} #{last_name}"
  end

  def sex
    if gender == true then "Male" else "Female" end
  end

  def age
    if dob.blank? then nil else (Time.now.to_s(:number).to_i - dob.to_time.to_s(:number).to_i)/10e9.to_i end
  end

  def role?(authorized_role)
    if role.nil? then false else role.downcase.to_sym == authorized_role end
  end
  
  # alternative methods (some find more natural...)
  def is_admin?
    role == 'admin'
  end
  
  def is_member?
    role == 'member'
  end

  # login by email address
  def self.authenticate(email, password)
    find_by_email(email).try(:authenticate, password)
  end

  # Private methods
  private

  def reformat_text
    self.first_name = self.name.downcase.squish.titleize unless self.first_name.nil?
    self.last_name = self.name.downcase.squish.titleize unless self.last_name.nil?
  end

  def reformat_email
    email = self.email.downcase  # change email to be all lowercase 
    self.email = email       # reset self.email to new lowercase email
  end

end
