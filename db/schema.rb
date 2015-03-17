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

ActiveRecord::Schema.define(version: 20150317143424) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "keywords", force: :cascade do |t|
    t.string   "keyword",    limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "page_keywords", force: :cascade do |t|
    t.integer  "page_id"
    t.integer  "keyword_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "page_keywords", ["keyword_id"], name: "index_page_keywords_on_keyword_id", using: :btree
  add_index "page_keywords", ["page_id"], name: "index_page_keywords_on_page_id", using: :btree

  create_table "page_views", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "actual_url", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "page_id"
    t.datetime "ended_at"
  end

  add_index "page_views", ["page_id"], name: "index_page_views_on_page_id", using: :btree

  create_table "pages", force: :cascade do |t|
    t.string   "canonical_url", limit: 255
    t.string   "title",         limit: 255
    t.string   "page_type",     limit: 255
    t.string   "author",        limit: 255
    t.integer  "site_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "description"
  end

  add_index "pages", ["canonical_url"], name: "index_pages_on_canonical_url", unique: true, using: :btree
  add_index "pages", ["site_id"], name: "index_pages_on_site_id", using: :btree

  create_table "sites", force: :cascade do |t|
    t.string   "domain",       limit: 255
    t.string   "organization", limit: 255
    t.string   "nationality",  limit: 255
    t.string   "language",     limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
