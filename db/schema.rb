# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20161003154946) do

  create_table "companies", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  add_index "companies", ["user_id"], name: "index_companies_on_user_id"

  create_table "currencies", force: :cascade do |t|
    t.string   "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "gaaps", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "indicators", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "order"
    t.integer  "type_id"
  end

  add_index "indicators", ["type_id"], name: "index_indicators_on_type_id"

  create_table "periods", force: :cascade do |t|
    t.date     "ending"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rates", force: :cascade do |t|
    t.integer  "period_id"
    t.integer  "currency_id"
    t.decimal  "rate"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "rates", ["currency_id"], name: "index_rates_on_currency_id"
  add_index "rates", ["period_id"], name: "index_rates_on_period_id"

  create_table "records", force: :cascade do |t|
    t.integer  "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "period_id"
    t.integer  "gaap_id"
    t.integer  "user_id"
  end

  add_index "records", ["company_id"], name: "index_records_on_company_id"
  add_index "records", ["gaap_id"], name: "index_records_on_gaap_id"
  add_index "records", ["period_id"], name: "index_records_on_period_id"
  add_index "records", ["user_id"], name: "index_records_on_user_id"

  create_table "types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "units", force: :cascade do |t|
    t.string   "name"
    t.integer  "type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal  "multiplier"
  end

  add_index "units", ["type_id"], name: "index_units_on_type_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.integer  "reputation",             default: 0
    t.boolean  "admin",                  default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "values", force: :cascade do |t|
    t.integer  "record_id"
    t.integer  "indicator_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.decimal  "amount"
    t.integer  "unit_id"
  end

  add_index "values", ["indicator_id"], name: "index_values_on_indicator_id"
  add_index "values", ["record_id"], name: "index_values_on_record_id"
  add_index "values", ["unit_id"], name: "index_values_on_unit_id"

end
