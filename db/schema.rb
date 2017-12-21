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

ActiveRecord::Schema.define(version: 20171221154531) do

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

  create_table "badges_sashes", force: :cascade do |t|
    t.integer "badge_id"
    t.integer "sash_id"
    t.boolean "notified_user", default: false
    t.datetime "created_at"
    t.index ["badge_id", "sash_id"], name: "index_badges_sashes_on_badge_id_and_sash_id"
    t.index ["badge_id"], name: "index_badges_sashes_on_badge_id"
    t.index ["sash_id"], name: "index_badges_sashes_on_sash_id"
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
    t.integer "shop_id"
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

  create_table "evaluations", force: :cascade do |t|
    t.integer "score", default: 0
    t.integer "user_id"
    t.integer "anunci_id"
    t.index ["anunci_id"], name: "index_evaluations_on_anunci_id"
    t.index ["user_id"], name: "index_evaluations_on_user_id"
  end

  create_table "merit_actions", force: :cascade do |t|
    t.integer "user_id"
    t.string "action_method"
    t.integer "action_value"
    t.boolean "had_errors", default: false
    t.string "target_model"
    t.integer "target_id"
    t.text "target_data"
    t.boolean "processed", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "merit_activity_logs", force: :cascade do |t|
    t.integer "action_id"
    t.string "related_change_type"
    t.integer "related_change_id"
    t.string "description"
    t.datetime "created_at"
  end

  create_table "merit_score_points", force: :cascade do |t|
    t.integer "score_id"
    t.integer "num_points", default: 0
    t.string "log"
    t.datetime "created_at"
    t.index ["score_id"], name: "index_merit_score_points_on_score_id"
  end

  create_table "merit_scores", force: :cascade do |t|
    t.integer "sash_id"
    t.string "category", default: "default"
    t.index ["sash_id"], name: "index_merit_scores_on_sash_id"
  end

  create_table "sashes", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.integer "coins", default: 42
    t.integer "sash_id"
    t.integer "level", default: 0
    t.index ["id"], name: "index_users_on_id"
    t.index ["platform_name", "email"], name: "index_users_on_platform_name_and_email"
  end

end
