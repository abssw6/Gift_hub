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

ActiveRecord::Schema[7.0].define(version: 2022_12_03_103157) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "chatrooms", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: :cascade do |t|
    t.datetime "event_date"
    t.string "category"
    t.string "title"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_events_on_user_id"
  end

  create_table "gifts", force: :cascade do |t|
    t.string "name"
    t.string "gift_type"
    t.float "rrp"
    t.text "description"
    t.text "link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "gifts_wishlists", force: :cascade do |t|
    t.bigint "wishlist_id", null: false
    t.bigint "gift_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["gift_id"], name: "index_gifts_wishlists_on_gift_id"
    t.index ["wishlist_id"], name: "index_gifts_wishlists_on_wishlist_id"
  end

  create_table "invitations", force: :cascade do |t|
    t.string "status"
    t.bigint "user_id", null: false
    t.bigint "event_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_invitations_on_event_id"
    t.index ["user_id"], name: "index_invitations_on_user_id"
  end

  create_table "messages", force: :cascade do |t|
    t.string "content"
    t.bigint "chatroom_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chatroom_id"], name: "index_messages_on_chatroom_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "usercommits", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "wishlist_id", null: false
    t.bigint "gift_id", null: false
    t.bigint "event_id", null: false
    t.boolean "is_commited", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_usercommits_on_event_id"
    t.index ["gift_id"], name: "index_usercommits_on_gift_id"
    t.index ["user_id"], name: "index_usercommits_on_user_id"
    t.index ["wishlist_id"], name: "index_usercommits_on_wishlist_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "nickname"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "wishlists", force: :cascade do |t|
    t.string "name"
    t.bigint "event_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_wishlists_on_event_id"
  end

  add_foreign_key "events", "users"
  add_foreign_key "gifts_wishlists", "gifts"
  add_foreign_key "gifts_wishlists", "wishlists"
  add_foreign_key "invitations", "events"
  add_foreign_key "invitations", "users"
  add_foreign_key "messages", "chatrooms"
  add_foreign_key "messages", "users"
  add_foreign_key "usercommits", "events"
  add_foreign_key "usercommits", "gifts"
  add_foreign_key "usercommits", "users"
  add_foreign_key "usercommits", "wishlists"
  add_foreign_key "wishlists", "events"
end
