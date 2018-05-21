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

ActiveRecord::Schema.define(version: 20180521145813) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "url_customs", force: :cascade do |t|
    t.string "url_name"
    t.bigint "url_original_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["url_original_id"], name: "index_url_customs_on_url_original_id"
  end

  create_table "url_originals", force: :cascade do |t|
    t.string "url_name"
    t.bigint "url_short_id"
    t.bigint "url_custom_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["url_custom_id"], name: "index_url_originals_on_url_custom_id"
    t.index ["url_short_id"], name: "index_url_originals_on_url_short_id"
  end

  create_table "url_shorts", force: :cascade do |t|
    t.string "url_name"
    t.bigint "url_original_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["url_original_id"], name: "index_url_shorts_on_url_original_id"
  end

end
