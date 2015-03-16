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

ActiveRecord::Schema.define(version: 20150316190953) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "keywords", force: true do |t|
    t.string   "keyword"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "page_views", force: true do |t|
    t.integer  "user_id"
    t.string   "actual_url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "page_id"
    t.datetime "ended_at"
  end

  add_index "page_views", ["page_id"], name: "index_page_views_on_page_id", using: :btree

  create_table "pages", force: true do |t|
    t.string   "canonical_url"
    t.string   "title"
    t.string   "page_type"
    t.string   "author"
    t.integer  "site_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "description"
    t.text     "keywords"
  end

  add_index "pages", ["canonical_url"], name: "index_pages_on_canonical_url", unique: true, using: :btree
  add_index "pages", ["site_id"], name: "index_pages_on_site_id", using: :btree

  create_table "sites", force: true do |t|
    t.string   "domain"
    t.string   "organization"
    t.string   "nationality"
    t.string   "language"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
