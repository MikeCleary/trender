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

ActiveRecord::Schema.define(version: 20131217163047) do

  create_table "comments", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "parent_id"
    t.integer  "reader_id"
    t.integer  "reading_list_id"
    t.text     "body"
    t.string   "in_reply_to"
  end

  create_table "moderators", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
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
  end

  add_index "moderators", ["email"], name: "index_moderators_on_email", unique: true, using: :btree
  add_index "moderators", ["reset_password_token"], name: "index_moderators_on_reset_password_token", unique: true, using: :btree

  create_table "places", force: true do |t|
    t.string   "country"
    t.string   "country_code"
    t.integer  "woeid"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "type"
  end

  create_table "reader_libraries", force: true do |t|
    t.integer  "reader_id"
    t.integer  "reading_list_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "readers", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "access_token"
    t.string   "access_token_secret"
  end

  create_table "reading_list_stories", force: true do |t|
    t.integer  "reading_list_id"
    t.integer  "story_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reading_list_topics", force: true do |t|
    t.integer  "reading_list_id"
    t.integer  "topic_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reading_lists", force: true do |t|
    t.integer  "trend_id"
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "reader_id"
    t.text     "description"
  end

  create_table "stories", force: true do |t|
    t.string   "title"
    t.string   "url"
    t.integer  "trend_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "source"
    t.string   "published"
    t.integer  "reading_list_id"
  end

  create_table "topics", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "trends", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "place_id"
    t.string   "subject"
  end

end
