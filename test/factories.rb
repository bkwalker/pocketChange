FactoryGirl.define do
  
  factory :item do
    association :user
    association :location
    name "Car"
    description "It's a piece of junk"
    price 4400.00
    picture "Lovely photo mate"
    condition "beat up pice of junk"
    sold true
    price_negotiable false
    tag "hastag hashtag homie"
    active false
  end
  
  factory :user do
    association :item

  end
  
  factory :book_details do
    association :item
    authors "JK Rowlings"
    course_number "23423"
    isbn "1231231"
    publication_year 1999
    publisher "me"
    amazon_lowest_price 44.33
  end
  
  
end


# FACTORIES FOR PATS (OLD STYLE, STILL WORKS)
# -------------------------------------------
# # Create factory for Animal class
#   FactoryGirl.define :animal do |a|
#     a.name "Cat"
#   end
#   
# # Create factory for Vaccine class
#   FactoryGirl.define :vaccine do |v|
#     v.name "Leukemia"
#     v.duration 365
#     v.association :animal
#   end
# 
# # Create factory for Owner class
#   FactoryGirl.define :owner do |o|
#     o.first_name "Alex"
#     o.last_name "Heimann"
#     o.street "10152 Sudberry Drive"
#     o.city "Wexford"
#     o.state "PA"
#     o.zip "15090"
#     o.active true
#     o.phone { rand(10 ** 10).to_s.rjust(10,'0') }
#     o.email { |a| "#{a.first_name}.#{a.last_name}@example.com".downcase }
#   end
# 
# # Create factory for Pet class
#   FactoryGirl.define :pet do |p|
#     p.name "Dusty"
#     p.female true
#     p.active true
#     p.date_of_birth 10.years.ago
#     p.association :owner
#     p.association :animal
#   end
# 
# # Create factory for Visit class
#   FactoryGirl.define :visit do |vi|
#     vi.date 6.months.ago.to_date
#     vi.weight 5
#     vi.notes "The cat has a lot of hair and sheds often.  Recommend shaving the cat."
#     vi.association :pet
#   end
#     
# # Create factory for Vaccination class
#   FactoryGirl.define :vaccination do |vn|
#     vn.association :visit
#     vn.association :vaccine
#   end
