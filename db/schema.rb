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

ActiveRecord::Schema.define(:version => 20141231170121) do

  create_table "details", :force => true do |t|
    t.integer  "trip_id",    :null => false
    t.date     "start",      :null => false
    t.date     "end",        :null => false
    t.integer  "price",      :null => false
    t.integer  "limit",      :null => false
    t.integer  "lowst",      :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "details", ["trip_id"], :name => "index_details_on_trip_id"

  create_table "members", :force => true do |t|
    t.string   "fullname",                           :null => false
    t.string   "address",                            :null => false
    t.string   "phone",                              :null => false
    t.string   "email"
    t.string   "name",                               :null => false
    t.boolean  "administrator",   :default => false, :null => false
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.string   "hashed_password"
  end

  create_table "reservations", :force => true do |t|
    t.integer  "member_id",                     :null => false
    t.integer  "detail_id",                     :null => false
    t.integer  "people"
    t.string   "food"
    t.boolean  "canceld",    :default => false
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  add_index "reservations", ["detail_id"], :name => "index_reservations_on_detail_id"
  add_index "reservations", ["member_id"], :name => "index_reservations_on_member_id"

  create_table "reviews", :force => true do |t|
    t.integer  "member_id"
    t.integer  "trip_id"
    t.string   "reviewtitle",   :null => false
    t.string   "reviewcontent", :null => false
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "reviews", ["member_id"], :name => "index_reviews_on_member_id"
  add_index "reviews", ["trip_id"], :name => "index_reviews_on_trip_id"

  create_table "trips", :force => true do |t|
    t.string   "tourname",    :null => false
    t.string   "tourcontent", :null => false
    t.string   "category",    :null => false
    t.string   "subcategory"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

end
