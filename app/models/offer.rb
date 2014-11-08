class Offer < ActiveRecord::Base
  #remove counter_amount, it's unnecessary
  #move pickup_time
  attr_accessible :accepted, :active, :amount, :counter_amount, :delivery_method, :item_id, :payment_method, :pickup_time, :user_id

  belongs_to :item
  belongs_to :user

  validates_presence_of :user_id, :active, :amount, :item_id

  # PAYMENT_METHODS = [["Cash",0],["Venmo", 1]]

  validates_numericality_of :item_id, :user_id, :greater_than => 0, :only_integer => true
  validates_numericality_of :amount, :greater_than => 0, :allow_nil => false
  validates_format_of :amount, :with => /\A\d+(?:\.\d{0,2})?\z/
  # validates_inclusion_of :payment_method, :allow_nil => true, :in => PAYMENT_METHODS.map {|k, v| v}, :message => "Not a valid payment method."
  validates_date :pickup_time, :allow_nil => true, :on_or_after => lambda { DateTime.current }, :message => "Pick up time must be today or later."
  validates_inclusion_of :accepted, :in => [true, false], :allow_nil => false
  validates_inclusion_of :active, :in => [true, false]

  scope :for_user, lambda { |uid| where("user_id = ?", uid) }
  scope :for_item, lambda { |iid| where("item_id = ?", iid) }
  scope :unaccepted, -> { where('accepted = ?', nil) }
  scope :accepted, -> { where(accepted: true) }
  scope :declined, -> { where(accepted: false) }
  scope :by_amount, -> { order('amount') }

  def diff_from_original_price?
    original_price = Item.find_by_id(item_id).price
    price_array = [amount, original_price]
    max_price = price_array.max
    min_price = price_array.min
    (max_price - min_price) > 0
  end
end
