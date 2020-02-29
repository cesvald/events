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

ActiveRecord::Schema.define(version: 2019_12_20_150204) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "air_tickets", id: :serial, force: :cascade do |t|
    t.integer "participant_id"
    t.datetime "arrive_at"
    t.string "arrive_to"
    t.datetime "leave_at"
    t.string "leave_from"
    t.datetime "estimated_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["participant_id"], name: "index_air_tickets_on_participant_id"
  end

  create_table "beds", id: :serial, force: :cascade do |t|
    t.integer "number", null: false
    t.integer "room_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "usable", default: true
    t.index ["room_id"], name: "index_beds_on_room_id"
  end

  create_table "bookings", id: :serial, force: :cascade do |t|
    t.date "start_date", null: false
    t.date "end_date"
    t.integer "bed_id", null: false
    t.integer "guest_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "amount"
    t.decimal "deposit_amount"
    t.string "deposit_state", default: "pending"
    t.index ["bed_id"], name: "index_bookings_on_bed_id"
    t.index ["guest_id"], name: "index_bookings_on_guest_id"
    t.index ["start_date", "end_date"], name: "index_bookings_on_start_date_and_end_date"
  end

  create_table "change_logs", id: :serial, force: :cascade do |t|
    t.text "change", null: false
    t.integer "author_id"
    t.integer "reviewer_id"
    t.boolean "is_reviewed", default: true
    t.datetime "reviewed_at"
    t.integer "logable_id"
    t.string "logable_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id"], name: "fk__change_logs_author_id"
    t.index ["logable_type", "logable_id"], name: "index_change_logs_on_logable_type_and_logable_id"
    t.index ["reviewer_id"], name: "fk__change_logs_reviewer_id"
  end

  create_table "compositions", id: :serial, force: :cascade do |t|
    t.integer "modality_id"
    t.integer "submodality_id"
    t.decimal "discount"
    t.index ["modality_id"], name: "index_compositions_on_modality_id"
    t.index ["submodality_id"], name: "index_compositions_on_submodality_id"
  end

  create_table "configurations", id: :serial, force: :cascade do |t|
    t.string "name"
    t.text "value"
  end

  create_table "events", id: :serial, force: :cascade do |t|
    t.string "name"
    t.date "start_at"
    t.date "end_at"
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "deposit_amount", default: "0.0"
    t.boolean "international", default: false
  end

  create_table "guests", id: :serial, force: :cascade do |t|
    t.string "name", null: false
    t.string "surname", null: false
    t.string "email", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "country"
    t.string "city"
    t.string "phone_number"
    t.string "mobile_number"
    t.string "identification"
    t.string "civil_status"
    t.string "profession"
    t.string "nationality"
    t.text "health_condition"
    t.text "receive_drug"
    t.text "symptoms"
    t.string "contact_name"
    t.string "contact_kin"
    t.string "contact_number"
    t.string "hotel"
    t.string "local_number"
    t.text "comments"
    t.boolean "is_initiate"
    t.integer "age"
    t.boolean "outside", default: false
  end

  create_table "historicals", id: :serial, force: :cascade do |t|
    t.string "name"
    t.decimal "value"
    t.date "start_date"
    t.integer "location_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["location_id"], name: "index_historicals_on_location_id"
  end

  create_table "houses", id: :serial, force: :cascade do |t|
    t.string "name", null: false
    t.string "sketch"
    t.integer "location_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "open_stay", default: false
    t.index ["location_id"], name: "index_houses_on_location_id"
  end

  create_table "locations", id: :serial, force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "modalities", id: :serial, force: :cascade do |t|
    t.string "name"
    t.integer "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "start_at"
    t.datetime "end_at"
    t.boolean "is_composed", default: false, null: false
    t.index ["event_id"], name: "index_modalities_on_event_id"
  end

  create_table "participant_spaces", id: :serial, force: :cascade do |t|
    t.integer "participant_id"
    t.integer "space_id"
    t.string "note"
    t.index ["participant_id"], name: "index_participant_spaces_on_participant_id"
    t.index ["space_id"], name: "index_participant_spaces_on_space_id"
  end

  create_table "participants", id: :serial, force: :cascade do |t|
    t.integer "guest_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "deposit_state", default: "pending"
    t.index ["guest_id"], name: "index_participants_on_guest_id"
  end

  create_table "participants_bookings", id: false, force: :cascade do |t|
    t.integer "participant_id"
    t.integer "booking_id"
    t.index ["booking_id"], name: "index_participants_bookings_on_booking_id"
    t.index ["participant_id"], name: "index_participants_bookings_on_participant_id"
  end

  create_table "payments", id: :serial, force: :cascade do |t|
    t.datetime "paid_at"
    t.decimal "amount"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "method"
    t.string "reason", default: "Evento"
    t.integer "payable_id"
    t.string "payable_type"
    t.index ["payable_id"], name: "index_payments_on_payable_id"
    t.index ["payable_type", "payable_id"], name: "index_payments_on_payable_type_and_payable_id"
  end

  create_table "places", id: :serial, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "places_events", id: :serial, force: :cascade do |t|
    t.integer "place_id"
    t.integer "event_id"
    t.index ["event_id"], name: "index_places_events_on_event_id"
    t.index ["place_id"], name: "index_places_events_on_place_id"
  end

  create_table "pre_bookings", id: :serial, force: :cascade do |t|
    t.integer "place_id"
    t.integer "location_id"
    t.date "start_date"
    t.date "end_date"
    t.integer "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["location_id"], name: "index_pre_bookings_on_location_id"
    t.index ["place_id"], name: "index_pre_bookings_on_place_id"
  end

  create_table "profiles", id: :serial, force: :cascade do |t|
    t.string "name"
  end

  create_table "profiles_users", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.integer "profile_id"
    t.index ["profile_id"], name: "index_profiles_users_on_profile_id"
    t.index ["user_id"], name: "index_profiles_users_on_user_id"
  end

  create_table "rooms", id: :serial, force: :cascade do |t|
    t.string "name", null: false
    t.integer "house_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["house_id"], name: "index_rooms_on_house_id"
  end

  create_table "spaces", id: :serial, force: :cascade do |t|
    t.integer "modality_id"
    t.integer "place_id"
    t.decimal "amount", default: "0.0"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_active", default: true, null: false
    t.index ["modality_id"], name: "index_spaces_on_modality_id"
    t.index ["place_id"], name: "index_spaces_on_place_id"
  end

  create_table "stays", id: :serial, force: :cascade do |t|
    t.integer "participant_id"
    t.integer "place_id"
    t.datetime "start_at"
    t.datetime "end_at"
    t.decimal "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["participant_id"], name: "index_stays_on_participant_id"
    t.index ["place_id"], name: "index_stays_on_place_id"
  end

  create_table "token_controls", id: :serial, force: :cascade do |t|
    t.integer "guest_id"
    t.text "auth_token"
    t.string "state", default: "pending"
    t.index ["guest_id"], name: "index_token_controls_on_guest_id"
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "country"
    t.string "name"
    t.string "surname"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "air_tickets", "participants", name: "fk_air_tickets_participant_id"
  add_foreign_key "beds", "rooms", name: "fk_beds_room_id"
  add_foreign_key "bookings", "beds", name: "fk_bookings_bed_id"
  add_foreign_key "bookings", "guests", name: "fk_bookings_guest_id"
  add_foreign_key "change_logs", "users", column: "author_id", name: "fk_change_logs_author_id"
  add_foreign_key "change_logs", "users", column: "reviewer_id", name: "fk_change_logs_reviewer_id"
  add_foreign_key "historicals", "locations", name: "fk_historicals_location_id"
  add_foreign_key "houses", "locations", name: "fk_houses_location_id"
  add_foreign_key "modalities", "events", name: "fk_modalities_event_id"
  add_foreign_key "participant_spaces", "participants", name: "fk_participant_spaces_participant_id"
  add_foreign_key "participant_spaces", "spaces", name: "fk_participant_spaces_space_id"
  add_foreign_key "participants", "guests", name: "fk_participants_guest_id"
  add_foreign_key "participants_bookings", "bookings", name: "fk_participants_bookings_booking_id"
  add_foreign_key "participants_bookings", "participants", name: "fk_participants_bookings_participant_id"
  add_foreign_key "places_events", "events", name: "fk_places_events_event_id"
  add_foreign_key "places_events", "places", name: "fk_places_events_place_id"
  add_foreign_key "pre_bookings", "locations", name: "fk_pre_bookings_location_id"
  add_foreign_key "pre_bookings", "places", name: "fk_pre_bookings_place_id"
  add_foreign_key "profiles_users", "profiles", name: "fk_profiles_users_profile_id"
  add_foreign_key "profiles_users", "users", name: "fk_profiles_users_user_id"
  add_foreign_key "rooms", "houses", name: "fk_rooms_house_id"
  add_foreign_key "spaces", "modalities", name: "fk_spaces_modality_id"
  add_foreign_key "spaces", "places", name: "fk_spaces_place_id"
  add_foreign_key "stays", "participants", name: "fk_stays_participant_id"
  add_foreign_key "stays", "places", name: "fk_stays_place_id"
  add_foreign_key "token_controls", "guests", name: "fk_token_controls_guest_id"
end
