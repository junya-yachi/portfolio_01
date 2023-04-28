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

ActiveRecord::Schema.define(version: 2023_04_28_055021) do

  create_table "clients", charset: "utf8", force: :cascade do |t|
    t.integer "user_id"
    t.string "cilent_name"
    t.string "phone_num"
    t.string "client_email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "inventories", charset: "utf8", force: :cascade do |t|
    t.integer "product_id"
    t.integer "acutual_inventory"
    t.integer "forecast_stock"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "product_clients", charset: "utf8", force: :cascade do |t|
    t.integer "product_id"
    t.integer "client_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "product_ufos", charset: "utf8", force: :cascade do |t|
    t.bigint "product_id", null: false
    t.bigint "ufo_catcher_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_id"], name: "index_product_ufos_on_product_id"
    t.index ["ufo_catcher_id"], name: "index_product_ufos_on_ufo_catcher_id"
  end

  create_table "products", charset: "utf8", force: :cascade do |t|
    t.date "order_date"
    t.string "product_name"
    t.integer "product_price"
    t.integer "product_quantity"
    t.string "product_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
    t.integer "client_id"
    t.integer "purchase_id"
  end

  create_table "ufo_catchers", charset: "utf8", force: :cascade do |t|
    t.string "machine_id"
    t.string "machine_name"
    t.integer "credit_num"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", charset: "utf8", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "product_ufos", "products"
  add_foreign_key "product_ufos", "ufo_catchers"
end
