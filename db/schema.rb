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

ActiveRecord::Schema.define(version: 20171207152751) do

  create_table "anuncis", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.float "latitude"
    t.float "longitude"
    t.integer "reward"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status", default: "open"
    t.integer "selectedBid_id"
    t.index ["selectedBid_id"], name: "index_anuncis_on_selectedBid_id"
    t.index ["user_id"], name: "index_anuncis_on_user_id"
  end

  create_table "bids", force: :cascade do |t|
    t.integer "anunci_id"
    t.integer "user_id"
    t.integer "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "accepted", default: false
    t.index ["anunci_id", "user_id"], name: "index_bids_on_anunci_id_and_user_id", unique: true
    t.index ["anunci_id"], name: "index_bids_on_anunci_id"
    t.index ["user_id"], name: "index_bids_on_user_id"
  end

  create_table "bought_coupons", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.integer "discount"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_bought_coupons_on_user_id"
  end

  create_table "comentaris", force: :cascade do |t|
    t.text "text"
    t.integer "user_id"
    t.integer "anunci_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "reward", default: 0
    t.index ["anunci_id"], name: "index_comentaris_on_anunci_id"
    t.index ["user_id"], name: "index_comentaris_on_user_id"
  end

  create_table "coupons", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.integer "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "shop_id"
    t.integer "discount"
    t.index ["shop_id"], name: "index_coupons_on_shop_id"
  end

  create_table "shops", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.float "latitude"
    t.float "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["user_id"], name: "index_shops_on_user_id"
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
