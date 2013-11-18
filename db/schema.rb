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

ActiveRecord::Schema.define(version: 20131118212959) do

  create_table "categories", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "text"
  end

  create_table "reservations", force: true do |t|
    t.string   "hour"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "restaurant_id"
    t.integer  "user_id"
    t.integer  "numberofseats"
    t.text     "day"
  end

  create_table "restaurants", force: true do |t|
    t.string   "name"
    t.string   "owner"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "address"
    t.datetime "opentime"
    t.datetime "closetime"
    t.integer  "tablesize"
    t.integer  "tables"
    t.integer  "totalsize"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
