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

ActiveRecord::Schema.define(version: 2019_12_04_064738) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "commentings", force: :cascade do |t|
    t.bigint "post_id"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_commentings_on_post_id"
  end

  create_table "comments", force: :cascade do |t|
    t.string "feedback"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.string "name"
    t.string "email"
    t.date "found_id_date"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "posts", force: :cascade do |t|
    t.string "user_name"
    t.string "country"
    t.string "province"
    t.string "district"
    t.string "sector"
    t.string "cell"
    t.string "village"
    t.string "gender"
    t.string "ID_number"
    t.date "date"
    t.string "post_reason"
    t.boolean "confirmation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.string "property_name"
    t.string "telephone_number"
    t.string "contact"
    t.date "lost_id_date_or_found_id_date"
    t.string "names"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "commentings", "posts"
  add_foreign_key "comments", "users"
end
