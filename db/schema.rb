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

ActiveRecord::Schema.define(version: 2019_02_26_151214) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.string "iata"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "flights", force: :cascade do |t|
    t.string "number"
    t.date "departure_time"
    t.date "arrival_time"
    t.integer "available_seats"
    t.bigint "company_id"
    t.bigint "origin_id"
    t.bigint "destiny_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["arrival_time"], name: "index_flights_on_arrival_time"
    t.index ["company_id"], name: "index_flights_on_company_id"
    t.index ["departure_time"], name: "index_flights_on_departure_time"
    t.index ["destiny_id"], name: "index_flights_on_destiny_id"
    t.index ["origin_id"], name: "index_flights_on_origin_id"
  end

  create_table "places", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.string "lat"
    t.string "lon"
    t.string "city"
    t.string "state"
    t.string "country"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stops", force: :cascade do |t|
    t.time "duration"
    t.bigint "place_id"
    t.bigint "flight_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["flight_id"], name: "index_stops_on_flight_id"
    t.index ["place_id"], name: "index_stops_on_place_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photo"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "flights", "companies"
  add_foreign_key "flights", "places", column: "destiny_id"
  add_foreign_key "flights", "places", column: "origin_id"
  add_foreign_key "stops", "flights"
  add_foreign_key "stops", "places"
end
