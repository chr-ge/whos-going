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

ActiveRecord::Schema.define(version: 2020_11_04_174850) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "hstore"
  enable_extension "plpgsql"

  create_table "contacts", force: :cascade do |t|
    t.string "full_name", null: false
    t.string "organization"
    t.text "notes"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "emails", force: :cascade do |t|
    t.string "label", default: "Email"
    t.string "email", null: false
    t.bigint "contact_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["contact_id"], name: "index_emails_on_contact_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "date"
    t.integer "attendees", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "phone_numbers", force: :cascade do |t|
    t.string "label", default: "Phone"
    t.string "phone_number", null: false
    t.bigint "contact_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["contact_id"], name: "index_phone_numbers_on_contact_id"
  end

  create_table "relationships", force: :cascade do |t|
    t.string "tag", null: false
    t.bigint "person_id"
    t.bigint "contact_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["contact_id"], name: "index_relationships_on_contact_id"
    t.index ["person_id"], name: "index_relationships_on_person_id"
  end

  create_table "rsvps", force: :cascade do |t|
    t.boolean "rsvp", null: false
    t.bigint "contact_id", null: false
    t.bigint "event_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["contact_id"], name: "index_rsvps_on_contact_id"
    t.index ["event_id"], name: "index_rsvps_on_event_id"
  end

  add_foreign_key "emails", "contacts"
  add_foreign_key "phone_numbers", "contacts"
  add_foreign_key "relationships", "contacts"
  add_foreign_key "relationships", "contacts", column: "person_id"
  add_foreign_key "rsvps", "contacts"
  add_foreign_key "rsvps", "events"
end
