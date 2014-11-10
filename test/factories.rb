FactoryGirl.define do
  
  factory :location do
    name "Ritz Carlton"
    description "This place is super fancy"
  end

  factory :offer do
    user_id 1
    item_id 1
    amount 5.79
    delivery_method 0
    pickup_time DateTime.current.tomorrow
    active true
  end

  factory :review do 
    comments "tester is great"
    rating 5
    reviewer_id 1
    user_id 1
  end

  factory :location_address do
    association :location
    city "Purcellville"
    state "VA"
    street "Whitacre Lane"
    zip 20132
    location_id 1
  end

 factory :user do
    first_name "Sophie"
    last_name "Batton"
    role "Member"
    email "sophieisgreatandpowerful1@andrew.cmu.edu"
    picture { Rack::Test::UploadedFile.new(File.join(Rails.root, 'public', 'example_files', 'profile.png')) }
    password "abc123"
    password_confirmation "abc123"
    rating 4.99
    active true
    gender true
  end

  factory :item do
    # association :user
    association :location
    name "Car"
    description "It's a piece of junk"
    price 4400.00
    picture { Rack::Test::UploadedFile.new(File.join(Rails.root, 'public', 'example_files', 'item.jpeg')) }
    condition 3
    sold true
    price_negotiable false
    tag "hastag hashtag"
    active true
    user_id 1
    location_id 1
  end
  
  
  factory :book_detail do
    association :item
    authors "JK Rowlings"
    course_number "23423"
    isbn "1231231"
    publication_year 1999
    publisher "me"
    amazon_lowest_price 44.33
  end

 
  
  
end
