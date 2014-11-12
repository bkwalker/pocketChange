class Review < ActiveRecord::Base
  attr_accessible :comments, :rating, :reviewer_id, :user_id

  #Callbacks
  after_save :update_user_rating

  #Relationships
  belongs_to :user

  validates_presence_of :reviewer_id, :user_id, :rating, :comments
  validates_numericality_of :reviewer_id, :user_id, :rating, :allow_nil => false, :greater_than => 0, :only_integer => true
  validate :not_yet_reviewed

  scope :for_user, lambda { |uid| where("user_id = ?", uid) }


	private

  def update_user_rating
  	u = User.find_by_id(user_id)
		ratings_for_user = Review.find_all_by_user_id(u.id).map{ |r| r.rating }
		if !ratings_for_user.empty?
			user_rating_sum = ratings_for_user.inject{|sum,x| sum + x } # sum all ratings for user
			u.rating = user_rating_sum * 1.0 / ratings_for_user.count # average all ratings for user
			u.save!
		end
	end

	# Reviewers should only be able to review user once
	def not_yet_reviewed
		!Review.find_all_by_user_id(user_id).map{ |r| r.reviewer_id }.include?(reviewer_id)
	end
end
