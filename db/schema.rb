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

ActiveRecord::Schema.define(version: 20160215025505) do

  create_table "cards", force: :cascade do |t|
    t.string   "question"
    t.string   "answer"
    t.integer  "deck_id"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.boolean  "is_disabled",        default: false
    t.string   "cards_file_name"
    t.string   "cards_content_type"
    t.integer  "cards_file_size"
    t.datetime "cards_updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.string   "image_path"
    t.string   "image_remote_url"
  end

  add_index "cards", ["deck_id"], name: "index_cards_on_deck_id"

  create_table "decks", force: :cascade do |t|
    t.string   "title"
    t.string   "author"
    t.string   "category"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "color_type"
    t.string   "image"
    t.string   "font_type"
    t.string   "description"
    t.string   "foreground_color"
  end

end
