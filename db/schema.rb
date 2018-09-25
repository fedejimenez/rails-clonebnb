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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2018_09_25_003145) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "acts_as_bookable_bookings", force: :cascade do |t|
    t.bigint "bookable_id"
    t.string "bookable_type"
    t.bigint "booker_id"
    t.string "booker_type"
    t.integer "amount"
    t.text "schedule"
    t.datetime "time_start"
    t.datetime "time_end"
    t.datetime "time"
    t.datetime "created_at"
    t.index ["bookable_type", "bookable_id"], name: "index_acts_as_bookable_bookings_bookable"
    t.index ["booker_type", "booker_id"], name: "index_acts_as_bookable_bookings_booker"
  end

  create_table "amenities", force: :cascade do |t|
    t.boolean "breakfast"
    t.boolean "wifi"
    t.boolean "tv"
    t.boolean "shampoo"
    t.boolean "elevator"
    t.boolean "iron"
    t.boolean "pool"
    t.boolean "gym"
    t.boolean "fire_extinguisher"
    t.boolean "carbon_monoxide_detector"
    t.boolean "smoke_detector"
    t.integer "listing_id"
  end

  create_table "authentications", force: :cascade do |t|
    t.string "uid"
    t.string "token"
    t.string "provider"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_authentications_on_user_id"
  end

  create_table "keyboard_listings", force: :cascade do |t|
    t.integer "keyword_id"
    t.integer "listing_id"
  end

  create_table "keyword_listings", force: :cascade do |t|
    t.integer "keyword_id"
    t.integer "listing_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "keywords", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "listing_images", force: :cascade do |t|
    t.integer "listing_id"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "listings", force: :cascade do |t|
    t.string "user_id", null: false
    t.string "name", null: false
    t.integer "place_type", null: false
    t.string "property_type", null: false
    t.integer "room_number", null: false
    t.integer "bed_number", null: false
    t.string "guest_number", null: false
    t.string "country", null: false
    t.string "state", null: false
    t.string "city", null: false
    t.string "zipcode", null: false
    t.string "address", null: false
    t.integer "price", null: false
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "availability_from"
    t.date "availability_to"
    t.integer "notice_period", default: 5, null: false
    t.integer "maximum_guests", default: 1, null: false
    t.integer "bathrooms"
    t.json "photos"
    t.integer "rating", default: 0
    t.text "schedule"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "rating"
    t.string "text"
    t.integer "user_id"
    t.integer "listing_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", null: false
    t.string "encrypted_password", limit: 128, null: false
    t.string "confirmation_token", limit: 128
    t.string "remember_token", limit: 128, null: false
    t.string "full_name"
    t.string "gender"
    t.string "phone"
    t.string "country"
    t.date "birthdate"
    t.string "firstname"
    t.string "lastname"
    t.boolean "verification"
    t.integer "role", default: 0
    t.string "avatar"
    t.index ["email"], name: "index_users_on_email"
    t.index ["remember_token"], name: "index_users_on_remember_token"
  end

  add_foreign_key "authentications", "users"
end
