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

ActiveRecord::Schema.define(version: 2022_11_12_202954) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.string "currency"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.decimal "total", default: "0.0"
    t.index ["user_id"], name: "index_accounts_on_user_id"
  end

  create_table "fixed_term_deposits", force: :cascade do |t|
    t.decimal "amount"
    t.date "creation_date"
    t.date "closing_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "movementlogs", force: :cascade do |t|
    t.decimal "amount"
    t.string "kind"
    t.bigint "movement_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["movement_id"], name: "index_movementlogs_on_movement_id"
  end

  create_table "movements", force: :cascade do |t|
    t.decimal "amount"
    t.string "concept"
    t.date "date"
    t.string "kind"
    t.bigint "account_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["account_id"], name: "index_movements_on_account_id"
    t.index ["user_id"], name: "index_movements_on_user_id"
  end

  create_table "refund_requests", force: :cascade do |t|
    t.string "concept"
    t.string "state"
    t.bigint "movement_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["movement_id"], name: "index_refund_requests_on_movement_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password_digest"
    t.string "rol"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "accounts", "users"
  add_foreign_key "movementlogs", "movements"
  add_foreign_key "movements", "accounts"
  add_foreign_key "movements", "users"
  add_foreign_key "refund_requests", "movements"
end
