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

ActiveRecord::Schema.define(version: 2018_05_21_095359) do

  create_table "active_storage_attachments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "admin_users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "fortunes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "message"
    t.bigint "from_user_id"
    t.bigint "user_id"
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_fortunes_on_deleted_at"
    t.index ["from_user_id"], name: "index_fortunes_on_from_user_id"
    t.index ["user_id"], name: "index_fortunes_on_user_id"
  end

  create_table "gifts", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.datetime "deleted_at"
    t.bigint "to_user_id"
    t.index ["deleted_at"], name: "index_gifts_on_deleted_at"
    t.index ["to_user_id"], name: "index_gifts_on_to_user_id"
    t.index ["user_id"], name: "index_gifts_on_user_id"
  end

  create_table "prize_users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "prize_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["prize_id"], name: "index_prize_users_on_prize_id"
    t.index ["user_id"], name: "index_prize_users_on_user_id"
  end

  create_table "prizes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.integer "price", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "thumbnail_file_name"
    t.string "thumbnail_content_type"
    t.integer "thumbnail_file_size"
    t.datetime "thumbnail_updated_at"
    t.string "name"
    t.string "description"
    t.index ["user_id"], name: "index_prizes_on_user_id"
  end

  create_table "teams", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_teams_on_user_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "gift_id"
    t.bigint "fortune_id"
    t.string "name"
    t.bigint "team_id"
    t.integer "gifts_count", default: 0
    t.integer "fortunes_count", default: 0
    t.bigint "prize_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["fortune_id"], name: "index_users_on_fortune_id"
    t.index ["gift_id"], name: "index_users_on_gift_id"
    t.index ["prize_id"], name: "index_users_on_prize_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["team_id"], name: "index_users_on_team_id"
  end

  add_foreign_key "fortunes", "users"
  add_foreign_key "fortunes", "users", column: "from_user_id"
  add_foreign_key "gifts", "users"
  add_foreign_key "gifts", "users", column: "to_user_id"
  add_foreign_key "prize_users", "prizes"
  add_foreign_key "prize_users", "users"
  add_foreign_key "prizes", "users"
  add_foreign_key "teams", "users"
  add_foreign_key "users", "fortunes"
  add_foreign_key "users", "gifts"
  add_foreign_key "users", "prizes"
  add_foreign_key "users", "teams"
end
