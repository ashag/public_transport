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

ActiveRecord::Schema.define(version: 2019_02_24_184134) do

  create_table "delays", force: :cascade do |t|
    t.integer "line_id"
    t.integer "delay_in_minutes"
    t.boolean "current", default: true
  end

  create_table "line_stops", force: :cascade do |t|
    t.integer "line_id"
    t.integer "stop_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lines", force: :cascade do |t|
    t.integer "lid"
    t.string "line_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "routes", force: :cascade do |t|
    t.integer "line_id"
    t.integer "stop_id"
    t.time "arrival_time"
    t.time "departure_time"
    t.boolean "current", default: true
    t.integer "stop_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["arrival_time"], name: "index_routes_on_arrival_time"
    t.index ["current"], name: "index_routes_on_current"
    t.index ["stop_id"], name: "index_routes_on_stop_id"
  end

  create_table "stops", force: :cascade do |t|
    t.integer "sid"
    t.integer "x_coord"
    t.integer "y_coord"
    t.integer "quadrant"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
