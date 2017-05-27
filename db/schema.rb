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

ActiveRecord::Schema.define(version: 20170527150305) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "invoice_updates", force: :cascade do |t|
    t.integer  "invoice_id"
    t.integer  "time_stamp"
    t.json     "object_changes"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["invoice_id"], name: "index_invoice_updates_on_invoice_id", using: :btree
  end

  create_table "invoices", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "order_updates", force: :cascade do |t|
    t.integer  "order_id"
    t.integer  "time_stamp"
    t.json     "object_changes"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["order_id"], name: "index_order_updates_on_order_id", using: :btree
  end

  create_table "orders", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "product_updates", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "time_stamp"
    t.json     "object_changes"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["product_id"], name: "index_product_updates_on_product_id", using: :btree
  end

  create_table "products", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "invoice_updates", "invoices"
  add_foreign_key "order_updates", "orders"
  add_foreign_key "product_updates", "products"
end
