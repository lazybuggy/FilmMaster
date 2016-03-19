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

ActiveRecord::Schema.define(version: 20160318222933) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "actors", primary_key: "actor_id", force: :cascade do |t|
    t.string "fName", null: false
    t.string "lName", null: false
  end

  create_table "directors", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "genres", primary_key: "genre_id", force: :cascade do |t|
    t.string "gname", limit: 20, null: false
  end

  create_table "movies", primary_key: "movieid", force: :cascade do |t|
    t.string  "mname",         limit: 20, null: false
    t.text    "summary",                  null: false
    t.integer "overallrating"
    t.string  "language",      limit: 10, null: false
    t.date    "datereleased",             null: false
    t.string  "maturitylevel", limit: 4,  null: false
    t.boolean "subtitle",                 null: false
    t.time    "duration",                 null: false
  end

  create_table "profiles", force: :cascade do |t|
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.string   "gender",     limit: 1,  null: false
    t.date     "birthday",              null: false
    t.string   "language",   limit: 10, null: false
    t.string   "agerange",   limit: 4,  null: false
  end

  create_table "ratings", primary_key: "ratingid", force: :cascade do |t|
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "movieid",      default: 0, null: false
    t.integer  "rating",                   null: false
    t.date     "datereleased",             null: false
  end

  create_table "roles", primary_key: "role_id", force: :cascade do |t|
    t.string "rname", limit: 30, null: false
  end

  create_table "studios", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", primary_key: "used_id", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "ratings", "movies", column: "movieid", primary_key: "movieid", name: "ratings_movieid_fkey"
end
