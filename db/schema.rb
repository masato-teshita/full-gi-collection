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

ActiveRecord::Schema.define(version: 20200517085050) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "areas", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "brands", force: :cascade do |t|
    t.string   "name",       null: false
    t.string   "image",      null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clips", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "shop_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shop_id"], name: "index_clips_on_shop_id", using: :btree
    t.index ["user_id"], name: "index_clips_on_user_id", using: :btree
  end

  create_table "genres", force: :cascade do |t|
    t.string   "name",       null: false
    t.string   "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "histories", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "shop_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shop_id"], name: "index_histories_on_shop_id", using: :btree
    t.index ["user_id"], name: "index_histories_on_user_id", using: :btree
  end

  create_table "shop_brands", force: :cascade do |t|
    t.integer "shop_id"
    t.integer "brand_id"
    t.index ["brand_id"], name: "index_shop_brands_on_brand_id", using: :btree
    t.index ["shop_id"], name: "index_shop_brands_on_shop_id", using: :btree
  end

  create_table "shop_genres", force: :cascade do |t|
    t.integer "shop_id"
    t.integer "genre_id"
    t.index ["genre_id"], name: "index_shop_genres_on_genre_id", using: :btree
    t.index ["shop_id"], name: "index_shop_genres_on_shop_id", using: :btree
  end

  create_table "shop_images", force: :cascade do |t|
    t.string   "shop_image"
    t.integer  "shop_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shop_id"], name: "index_shop_images_on_shop_id", using: :btree
  end

  create_table "shop_users", force: :cascade do |t|
    t.integer "shop_id"
    t.integer "user_id"
    t.index ["shop_id"], name: "index_shop_users_on_shop_id", using: :btree
    t.index ["user_id"], name: "index_shop_users_on_user_id", using: :btree
  end

  create_table "shops", force: :cascade do |t|
    t.string   "name",       null: false
    t.text     "outline"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "area_id"
    t.string   "address"
    t.float    "latitude"
    t.float    "longitude"
    t.index ["area_id"], name: "index_shops_on_area_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",                                             null: false
    t.string   "email",                  default: "",              null: false
    t.string   "encrypted_password",     default: "",              null: false
    t.string   "cover_image"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
    t.string   "image"
    t.text     "introduction",           default: "よろしくお願いいたします！"
    t.boolean  "admin",                  default: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["name"], name: "index_users_on_name", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "woms", force: :cascade do |t|
    t.text     "content"
    t.float    "rate"
    t.string   "visit_type"
    t.integer  "user_id"
    t.integer  "shop_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "title"
    t.string   "image"
    t.date     "visit_date"
    t.index ["shop_id"], name: "index_woms_on_shop_id", using: :btree
    t.index ["user_id"], name: "index_woms_on_user_id", using: :btree
  end

  add_foreign_key "clips", "shops"
  add_foreign_key "clips", "users"
  add_foreign_key "histories", "shops"
  add_foreign_key "histories", "users"
  add_foreign_key "shop_brands", "brands"
  add_foreign_key "shop_brands", "shops"
  add_foreign_key "shop_genres", "genres"
  add_foreign_key "shop_genres", "shops"
  add_foreign_key "shop_images", "shops"
  add_foreign_key "shop_users", "shops"
  add_foreign_key "shop_users", "users"
  add_foreign_key "shops", "areas"
  add_foreign_key "woms", "shops"
  add_foreign_key "woms", "users"
end
