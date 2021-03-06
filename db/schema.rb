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

ActiveRecord::Schema.define(version: 20140515071422) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "birth_dates", force: true do |t|
    t.datetime "date"
    t.string   "title"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "birth_dates", ["user_id"], name: "index_birth_dates_on_user_id", using: :btree

  create_table "comments", force: true do |t|
    t.text     "content"
    t.integer  "note_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["note_id"], name: "index_comments_on_note_id", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "emotions", force: true do |t|
    t.integer  "page_id"
    t.string   "emotion_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "emotions", ["page_id"], name: "index_emotions_on_page_id", using: :btree

  create_table "follows", force: true do |t|
    t.integer  "follower_id"
    t.integer  "following_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "follows", ["follower_id"], name: "index_follows_on_follower_id", using: :btree
  add_index "follows", ["following_id"], name: "index_follows_on_following_id", using: :btree

  create_table "likes", force: true do |t|
    t.integer  "user_id"
    t.integer  "note_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "likes", ["note_id"], name: "index_likes_on_note_id", using: :btree
  add_index "likes", ["user_id"], name: "index_likes_on_user_id", using: :btree

  create_table "notes", force: true do |t|
    t.text     "content"
    t.boolean  "private"
    t.integer  "page_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "notes", ["page_id"], name: "index_notes_on_page_id", using: :btree
  add_index "notes", ["user_id"], name: "index_notes_on_user_id", using: :btree

  create_table "pages", force: true do |t|
    t.datetime "published_at"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "pages", ["user_id"], name: "index_pages_on_user_id", using: :btree

  create_table "profiles", force: true do |t|
    t.integer  "user_id"
    t.string   "display_name"
    t.string   "gender"
    t.datetime "birth_date"
    t.string   "country"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "profiles", ["user_id"], name: "index_profiles_on_user_id", using: :btree

  create_table "tasks", force: true do |t|
    t.boolean  "done"
    t.text     "description"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tasks", ["user_id"], name: "index_tasks_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
