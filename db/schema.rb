# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20141029034856) do

  create_table "availabilities", :force => true do |t|
    t.integer  "location_id"
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "book_details", :force => true do |t|
    t.integer  "item_id"
    t.text     "authors"
    t.string   "course_number"
    t.string   "isbn"
    t.integer  "publication_year"
    t.string   "publisher"
    t.decimal  "amazon_lowest_price"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  create_table "conversations", :force => true do |t|
    t.integer  "item_id"
    t.integer  "buyer_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "items", :force => true do |t|
    t.integer  "user_id"
    t.integer  "location_id"
    t.string   "name"
    t.text     "description"
    t.decimal  "price"
    t.string   "picture"
    t.boolean  "price_negotiable"
    t.string   "condition"
    t.boolean  "sold"
    t.text     "tag"
    t.boolean  "active"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "location_addresses", :force => true do |t|
    t.string   "street"
    t.integer  "zip"
    t.string   "city"
    t.string   "state"
    t.integer  "location_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "locations", :force => true do |t|
    t.integer  "user_id"
    t.integer  "item_id"
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "messages", :force => true do |t|
    t.integer  "user_id"
    t.integer  "conversation_id"
    t.text     "content"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "offers", :force => true do |t|
    t.integer  "item_id"
    t.integer  "user_id"
    t.decimal  "amount"
    t.decimal  "counter_amount"
    t.string   "payment_method"
    t.datetime "pickup_time"
    t.string   "delivery_method"
    t.boolean  "accepted"
    t.boolean  "active"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "reviews", :force => true do |t|
    t.integer  "user_id"
    t.integer  "reviewer_id"
    t.text     "comments"
    t.integer  "rating"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "picture"
    t.string   "password_digest"
    t.decimal  "rating"
    t.boolean  "active"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.boolean  "gender"
    t.date     "dob"
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
  end

end
