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

ActiveRecord::Schema[7.1].define(version: 2024_07_03_002858) do
  create_table "cryptocurrencies", force: :cascade do |t|
    t.string "name"
    t.string "symbol"
    t.decimal "market_cap"
    t.decimal "price"
    t.decimal "volume_24h"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cryptocurrency_exchanges", force: :cascade do |t|
    t.integer "cryptocurrency_id", null: false
    t.integer "exchange_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cryptocurrency_id"], name: "index_cryptocurrency_exchanges_on_cryptocurrency_id"
    t.index ["exchange_id"], name: "index_cryptocurrency_exchanges_on_exchange_id"
  end

  create_table "exchanges", force: :cascade do |t|
    t.string "name"
    t.string "website_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "historical_prices", force: :cascade do |t|
    t.decimal "price"
    t.datetime "datetime"
    t.integer "cryptocurrency_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cryptocurrency_id"], name: "index_historical_prices_on_cryptocurrency_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "wallet_cryptocurrencies", force: :cascade do |t|
    t.integer "wallet_id", null: false
    t.integer "cryptocurrency_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cryptocurrency_id"], name: "index_wallet_cryptocurrencies_on_cryptocurrency_id"
    t.index ["wallet_id"], name: "index_wallet_cryptocurrencies_on_wallet_id"
  end

  create_table "wallets", force: :cascade do |t|
    t.string "name"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_wallets_on_user_id"
  end

  add_foreign_key "cryptocurrency_exchanges", "cryptocurrencies"
  add_foreign_key "cryptocurrency_exchanges", "exchanges"
  add_foreign_key "historical_prices", "cryptocurrencies"
  add_foreign_key "wallet_cryptocurrencies", "cryptocurrencies"
  add_foreign_key "wallet_cryptocurrencies", "wallets"
  add_foreign_key "wallets", "users"
end
