namespace :db do
  desc "Erase and fill database"
  # creating a rake task within db namespace called 'populate'
  # executing 'rake db:populate' will cause this script to run
  task :populate => :environment do
    # Docs at: http://faker.rubyforge.org/rdoc/
    require 'faker'
    
    puts "Deleting all previously made entities..."
    [User, Item, Review, Offer, BookDetail, Message, Conversation, Location, Availability].each(&:delete_all)
    puts "All previously made entities have been deleted!"

    item_picture_path = "./public/example_files/item.jpeg"
    profile_picture_path = "./public/example_files/profile.png"
    
    #Create a user
    user = User.new
    user.first_name = "Sherlock"
    user.last_name = "Holmes"
    user.gender = true
    user.picture = File.open(profile_picture_path)
    user.email = "test@andrew.cmu.edu"
    user.rating = 5
    user.password = "secret"
    user.password_confirmation = "secret"
    user.role = "Admin"
    user.active = true
    user.save!

    item_names = ["Redwood Table", "Black Sofa", "Purple Couch", "Macbook Pro",
      "iPad Mini 2 Retina", "Cherrywood Night Stand", "Maple Coffee Table"]
    item_descriptions = ["Buy me or don't buy me, but I'm going to sell.",
      "Buy here or be square.", "You snooze, you lose.", "Early bird gets the worm",
      "Made with love, but only if you buy it."]
    item_tags = ["furniture", "electronics","books", "clothes", "tshirts",
      "shoes"]
    review_comments = ["Terrible! Could've gotten better service from a cow.",
      "Awesome! I would recommend this guy.", "Eh. This guy is alright I guess."]

    num_users = 40
    puts "putting #{num_users} users into system"
    num_users.times do |j|
      u = User.new
      u.first_name = Faker::Name.first_name
      u.last_name = Faker::Name.last_name
      u.email = u.first_name.slice(0) + u.last_name + "@andrew.cmu.edu"
      u.gender = [true, false].sample
      u.rating = 0
      u.picture = File.open(profile_picture_path)
      u.password = "secret"
      u.password_confirmation = "secret"
      u.role = "Admin"
      u.active = true
      u.save!

      num_items = [0,1,2,5,10].sample
      num_items.times do |k|
        i = Item.new
        i.user_id = u.id
        i.picture = File.open(item_picture_path)
        i.name = item_names.sample
        i.description = item_descriptions.sample
        i.price = (1..290).to_a.sample
        i.condition = (0..4).to_a.sample
        i.price_negotiable = [true,false].sample
        i.active = [true, false].sample
        i.sold = i.active ? false : true
        i.tag = item_tags.sample

        num_tags = [0,1,2,5,10].sample
        num_tags.times do |t|
          i.tag += item_tags.sample
        end
        i.save!
      end
  
      num_reviews = [0,1,2,5,10].sample    
      num_reviews.times do |l|
        r = Review.new
        r.user_id = u.id
        r.reviewer_id = (1..User.all.count).to_a.sample
        r.comments = review_comments.sample
        r.rating = (1..5).to_a.sample
        r.save!
      end
    end

  end
end