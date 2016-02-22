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

ActiveRecord::Schema.define(version: 20160222062043) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "favorites", force: :cascade do |t|
    t.integer  "song_id"
    t.integer  "member_id"
    t.datetime "time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "favorites", ["member_id", "song_id"], name: "index_favorites_on_member_id_and_song_id", using: :btree

  create_table "members", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password"
    t.string   "social_media_connected"
    t.string   "social_profile"
    t.integer  "number_of_uploads"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "shares", force: :cascade do |t|
    t.integer  "song_id"
    t.integer  "member_id"
    t.datetime "time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "shares", ["member_id", "song_id"], name: "index_shares_on_member_id_and_song_id", using: :btree

  create_table "songs", force: :cascade do |t|
    t.string   "artist"
    t.string   "title"
    t.string   "url"
    t.time     "duration"
    t.string   "format"
    t.boolean  "is_playing"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "streams", force: :cascade do |t|
    t.integer  "song_id"
    t.integer  "member_id"
    t.boolean  "is_playing"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
