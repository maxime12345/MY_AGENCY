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

ActiveRecord::Schema.define(version: 20180227125726) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "applications", force: :cascade do |t|
    t.bigint "flat_id"
    t.boolean "validation", default: false
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["flat_id"], name: "index_applications_on_flat_id"
    t.index ["user_id"], name: "index_applications_on_user_id"
  end

  create_table "availabilities", force: :cascade do |t|
    t.bigint "flat_id"
    t.date "start_time"
    t.boolean "visit_confirmed", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["flat_id"], name: "index_availabilities_on_flat_id"
  end

  create_table "bookings", force: :cascade do |t|
    t.bigint "availability_id"
    t.bigint "application_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["application_id"], name: "index_bookings_on_application_id"
    t.index ["availability_id"], name: "index_bookings_on_availability_id"
  end

  create_table "doc_categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "doc_files", force: :cascade do |t|
    t.bigint "folder_id"
    t.bigint "doc_category_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["doc_category_id"], name: "index_doc_files_on_doc_category_id"
    t.index ["folder_id"], name: "index_doc_files_on_folder_id"
  end

  create_table "flats", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.integer "price"
    t.bigint "user_id"
    t.text "description"
    t.date "publication_date"
    t.integer "surface"
    t.integer "nb_rooms"
    t.string "ad_url"
    t.integer "visit_capacity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_flats_on_user_id"
  end

  create_table "folders", force: :cascade do |t|
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_folders_on_user_id"
  end

  create_table "messages", force: :cascade do |t|
    t.bigint "flat_id"
    t.text "content"
    t.boolean "read", default: false
    t.bigint "sender_id"
    t.bigint "recipient_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["flat_id"], name: "index_messages_on_flat_id"
    t.index ["recipient_id"], name: "index_messages_on_recipient_id"
    t.index ["sender_id"], name: "index_messages_on_sender_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "applications", "flats"
  add_foreign_key "applications", "users"
  add_foreign_key "availabilities", "flats"
  add_foreign_key "bookings", "applications"
  add_foreign_key "bookings", "availabilities"
  add_foreign_key "doc_files", "doc_categories"
  add_foreign_key "doc_files", "folders"
  add_foreign_key "flats", "users"
  add_foreign_key "folders", "users"
  add_foreign_key "messages", "flats"
  add_foreign_key "messages", "users", column: "recipient_id"
  add_foreign_key "messages", "users", column: "sender_id"
end
