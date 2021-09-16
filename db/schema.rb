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

ActiveRecord::Schema.define(version: 2021_09_15_234707) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.bigint "invoice_id", null: false
    t.string "type", null: false
    t.string "street"
    t.string "city"
    t.string "state"
    t.string "post_code"
    t.string "country"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["invoice_id", "type"], name: "index_addresses_on_invoice_id_and_type", unique: true
    t.index ["invoice_id"], name: "index_addresses_on_invoice_id"
  end

  create_table "invoices", force: :cascade do |t|
    t.date "payment_date"
    t.string "description"
    t.bigint "payment_term_id", null: false
    t.string "client_name"
    t.string "client_email"
    t.integer "status", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["payment_term_id"], name: "index_invoices_on_payment_term_id"
  end

  create_table "line_items", force: :cascade do |t|
    t.bigint "invoice_id", null: false
    t.string "name"
    t.integer "quantity", default: 0, null: false
    t.integer "price", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["invoice_id"], name: "index_line_items_on_invoice_id"
  end

  create_table "payment_terms", force: :cascade do |t|
    t.string "name", null: false
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "addresses", "invoices"
  add_foreign_key "invoices", "payment_terms"
  add_foreign_key "line_items", "invoices"
end
