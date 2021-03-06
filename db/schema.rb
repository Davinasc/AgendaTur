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

ActiveRecord::Schema.define(version: 20171104155126) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clients", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "phone"
    t.string "hotel"
    t.string "apartment"
    t.boolean "adult"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "routes", force: :cascade do |t|
    t.string "name", null: false
    t.decimal "price", precision: 12, scale: 2, null: false
  end

  create_table "sales", force: :cascade do |t|
    t.decimal "total_price", precision: 12, scale: 2, null: false
    t.decimal "receive_price", precision: 12, scale: 2
    t.decimal "voucher_price", precision: 12, scale: 2
    t.bigint "user_id"
    t.bigint "tour_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tour_id"], name: "index_sales_on_tour_id"
    t.index ["user_id"], name: "index_sales_on_user_id"
  end

  create_table "schedulings", force: :cascade do |t|
    t.bigint "sale_id"
    t.bigint "client_id"
    t.index ["client_id"], name: "index_schedulings_on_client_id"
    t.index ["sale_id"], name: "index_schedulings_on_sale_id"
  end

  create_table "tours", force: :cascade do |t|
    t.date "date", null: false
    t.integer "vacancies", null: false
    t.time "arrival_time", null: false
    t.time "departure_time", null: false
    t.bigint "route_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["route_id"], name: "index_tours_on_route_id"
    t.index ["user_id"], name: "index_tours_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "provider", default: "email", null: false
    t.string "uid", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "name"
    t.string "nickname"
    t.string "image"
    t.string "email"
    t.json "tokens"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_type"
    t.string "qualification"
    t.decimal "comission", precision: 12, scale: 2, default: "0.0"
    t.datetime "deleted_at"
    t.boolean "admin", default: false
    t.string "phone"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true
  end

  add_foreign_key "sales", "tours"
  add_foreign_key "sales", "users"
  add_foreign_key "schedulings", "clients"
  add_foreign_key "schedulings", "sales"
  add_foreign_key "tours", "routes"
  add_foreign_key "tours", "users"
end
