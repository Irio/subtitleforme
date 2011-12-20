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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20111220102057) do

  create_table "groups", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "releases", :force => true do |t|
    t.string   "name"
    t.integer  "video_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "releases", ["video_id"], :name => "index_releases_on_video_id"

  create_table "subtitles", :force => true do |t|
    t.integer  "group_id"
    t.integer  "user_id"
    t.integer  "release_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "subtitles", ["group_id"], :name => "index_subtitles_on_group_id"
  add_index "subtitles", ["release_id"], :name => "index_subtitles_on_release_id"
  add_index "subtitles", ["user_id"], :name => "index_subtitles_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "nick"
    t.string   "password"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "group_id"
  end

  create_table "videos", :force => true do |t|
    t.string   "imdb_id"
    t.string   "tmdb_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
