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

ActiveRecord::Schema.define(version: 20171103113727) do

  create_table "anuncis", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.decimal "latitude"
    t.decimal "longitude"
    t.integer "reward"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_anuncis_on_user_id"
  end

  create_table "comentaris", force: :cascade do |t|
    t.text "text"
    t.integer "user_id"
    t.integer "anunci_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["anunci_id"], name: "index_comentaris_on_anunci_id"
    t.index ["user_id"], name: "index_comentaris_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "image_url"
    t.string "platform_name"
    t.string "active_token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email"
    t.integer "coins", default: 0
    t.index ["id"], name: "index_users_on_id"
    t.index ["platform_name", "email"], name: "index_users_on_platform_name_and_email"
  end

end
