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

ActiveRecord::Schema.define(version: 20170123092916) do

  create_table "railway_stations", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "name"
  end

  create_table "railway_stations_routes", force: :cascade do |t|
    t.integer "railway_station_id"
    t.integer "route_id"
    t.integer "position"
    t.time    "arrival_time",       default: '2000-01-01 08:34:07'
    t.time    "departure_time",     default: '2000-01-01 08:34:07'
    t.index ["railway_station_id"], name: "index_railway_stations_routes_on_railway_station_id"
    t.index ["route_id"], name: "index_railway_stations_routes_on_route_id"
  end

  create_table "routes", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tickets", force: :cascade do |t|
    t.integer "number"
    t.integer "train_id",         null: false
    t.integer "user_id",          null: false
    t.integer "start_station_id", null: false
    t.integer "end_station_id",   null: false
    t.string  "document_series"
    t.string  "document_number"
    t.string  "first_name"
    t.string  "second_name"
    t.string  "last_name"
    t.string  "birth_day"
    t.index ["end_station_id"], name: "index_tickets_on_end_station_id"
    t.index ["start_station_id"], name: "index_tickets_on_start_station_id"
    t.index ["train_id"], name: "index_tickets_on_train_id"
    t.index ["user_id"], name: "index_tickets_on_user_id"
  end

  create_table "trains", force: :cascade do |t|
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "number"
    t.integer  "current_station_id"
    t.integer  "route_id"
    t.boolean  "wagon_order"
    t.index ["current_station_id"], name: "index_trains_on_current_station_id"
    t.index ["route_id"], name: "index_trains_on_route_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.boolean  "admin",                  default: false
    t.string   "second_name",            default: ""
    t.string   "last_name",              default: ""
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["name"], name: "index_users_on_name"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "wagons", force: :cascade do |t|
    t.integer  "number"
    t.integer  "train_id"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.string   "type"
    t.integer  "top_seats",         default: 0
    t.integer  "bottom_seats",      default: 0
    t.integer  "side_top_seats",    default: 0
    t.integer  "side_bottom_seats", default: 0
    t.integer  "seats",             default: 0
    t.index ["train_id"], name: "index_wagons_on_train_id"
  end

end
