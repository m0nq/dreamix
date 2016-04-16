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

ActiveRecord::Schema.define(version: 20160416023759) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "communities", force: :cascade do |t|
    t.integer  "members_id"
    t.integer  "streams_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "communities", ["members_id", "streams_id"], name: "index_communities_on_members_id_and_streams_id", using: :btree

  create_table "favorites", force: :cascade do |t|
    t.integer  "songs_id"
    t.integer  "members_id"
    t.datetime "time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "favorites", ["members_id", "songs_id"], name: "index_favorites_on_members_id_and_songs_id", using: :btree

  create_table "members", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.boolean  "social_media_connected"
    t.string   "social_profile"
    t.integer  "number_of_uploads"
    t.integer  "soundcloud_user_id"
    t.integer  "invite_code"
    t.boolean  "is_activated"
    t.string   "soundcloud_access_token"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "members", ["email"], name: "index_members_on_email", using: :btree
  add_index "members", ["name"], name: "index_members_on_name", using: :btree
  add_index "members", ["social_profile"], name: "index_members_on_social_profile", using: :btree
  add_index "members", ["soundcloud_user_id"], name: "index_members_on_soundcloud_user_id", using: :btree

  create_table "songs", force: :cascade do |t|
    t.string   "artist"
    t.string   "title"
    t.string   "url"
    t.time     "duration"
    t.string   "format"
    t.boolean  "is_playing"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "streams_id"
  end

  add_index "songs", ["artist"], name: "index_songs_on_artist", using: :btree
  add_index "songs", ["streams_id"], name: "index_songs_on_streams_id", using: :btree
  add_index "songs", ["title"], name: "index_songs_on_title", using: :btree
  add_index "songs", ["url"], name: "index_songs_on_url", using: :btree

  create_table "streams", force: :cascade do |t|
    t.boolean  "is_playing", default: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

end
