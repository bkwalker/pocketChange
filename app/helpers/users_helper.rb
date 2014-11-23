module UsersHelper
 def show_stars(user)
   image_tag "#{user.rating.round}star.png"
 end

 def review_show_stars(review)
   image_tag "#{review.rating.round}star.png"
 end
end
