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

ActiveRecord::Schema.define(version: 20161114154016) do

  create_table "cards", force: :cascade do |t|
    t.integer  "points"
    t.boolean  "status"
    t.integer  "client_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "cards", ["client_id"], name: "index_cards_on_client_id"

  create_table "clients", id: false, force: :cascade do |t|
    t.string   "id"
    t.string   "name"
    t.string   "surname"
    t.string   "tlf"
    t.string   "email"
    t.string   "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "exchanges", force: :cascade do |t|
    t.integer  "card_id"
    t.integer  "price_id"
    t.datetime "exchange_date"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "exchanges", ["card_id"], name: "index_exchanges_on_card_id"
  add_index "exchanges", ["price_id"], name: "index_exchanges_on_price_id"

  create_table "prices", force: :cascade do |t|
    t.integer  "store_id"
    t.datetime "buy_date"
    t.integer  "total"
    t.integer  "card_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "prices", ["card_id"], name: "index_prices_on_card_id"

  create_table "purchases", force: :cascade do |t|
    t.integer  "id_store"
    t.integer  "total"
    t.datetime "buy_date"
    t.integer  "card_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
