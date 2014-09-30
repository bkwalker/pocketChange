class Review < ActiveRecord::Base
  attr_accessible :comments, :rating, :reviewer_id, :user_id
end
