require 'test_helper'

class ItemTest < ActiveSupport::TestCase
  should belong_to(:user)
  should belong_to(:location)
  should have_many(:offers)
  should have_one(:book_detail)

end
