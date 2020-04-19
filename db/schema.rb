# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_04_19_003635) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "record_details", force: :cascade do |t|
    t.decimal "sleep", precision: 4, scale: 2
    t.decimal "work", precision: 4, scale: 2
    t.decimal "exercise", precision: 4, scale: 2
    t.decimal "leisure", precision: 4, scale: 2
    t.bigint "user_id", null: false
    t.bigint "record_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["record_id"], name: "index_record_details_on_record_id"
    t.index ["user_id"], name: "index_record_details_on_user_id"
  end

  create_table "records", force: :cascade do |t|
    t.date "day"
    t.text "description"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_records_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "record_details", "records"
  add_foreign_key "record_details", "users"
  add_foreign_key "records", "users"
end
