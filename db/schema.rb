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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150212185452) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "devices", force: :cascade do |t|
    t.string   "device_id",              limit: 255
    t.string   "device_type",            limit: 255
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.string   "additional_information", limit: 255
    t.money    "rate_daily",                         scale: 2
  end

  create_table "rental_records", force: :cascade do |t|
    t.string   "email",      limit: 255
    t.string   "renter",     limit: 255
    t.date     "end"
    t.integer  "device_id"
    t.integer  "total_time"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "comment",    limit: 255
  end

  create_table "rentals", force: :cascade do |t|
    t.string   "email",      limit: 255
    t.date     "end"
    t.integer  "device_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "renter",     limit: 255
    t.string   "comment",    limit: 255
    t.string   "project"
  end

end
