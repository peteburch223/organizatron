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

ActiveRecord::Schema.define(version: 20160426155422) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "material_tag_links", force: :cascade do |t|
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "tag_id"
    t.integer  "material_id"
  end

  add_index "material_tag_links", ["material_id"], name: "index_material_tag_links_on_material_id", using: :btree
  add_index "material_tag_links", ["tag_id"], name: "index_material_tag_links_on_tag_id", using: :btree

  create_table "materials", force: :cascade do |t|
    t.string   "link_url"
    t.string   "title"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "tags", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "votes", force: :cascade do |t|
    t.integer  "value"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "material_tag_link_id"
  end

  add_index "votes", ["material_tag_link_id"], name: "index_votes_on_material_tag_link_id", using: :btree

end
