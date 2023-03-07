# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_03_02_173657) do

  create_table "acorns", force: :cascade do |t|
    t.string "content"
    t.date "date_created"
    t.string "img"
    t.string "link"
    t.boolean "reply"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_acorns_on_user_id"
  end

  create_table "follows", force: :cascade do |t|
    t.integer "follower_id"
    t.integer "followed_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["follower_id", "followed_id"], name: "index_follows_on_follower_id_and_followed_id", unique: true
  end

  create_table "likes", force: :cascade do |t|
    t.integer "acorn_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["acorn_id", "user_id"], name: "index_likes_on_acorn_id_and_user_id", unique: true
    t.index ["acorn_id"], name: "index_likes_on_acorn_id"
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "replies", force: :cascade do |t|
    t.integer "acorn_id", null: false
    t.integer "reply_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["acorn_id"], name: "index_replies_on_acorn_id"
    t.index ["reply_id"], name: "index_replies_on_reply_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "profile_img", default: "profile_photo.jpg"
    t.string "cover_img"
    t.string "bio"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
  end

  add_foreign_key "acorns", "users"
  add_foreign_key "likes", "acorns"
  add_foreign_key "likes", "users"
  add_foreign_key "replies", "acorns"
  add_foreign_key "replies", "acorns", column: "reply_id"
end
