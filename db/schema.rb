ActiveRecord::Schema.define(version: 20151026232947) do

  create_table "airports", force: :cascade do |t|
    t.string   "name"
    t.string   "country"
    t.string   "city"
    t.string   "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bookings", force: :cascade do |t|
    t.integer  "no_of_passengers"
    t.date     "return_time"
    t.integer  "flight_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "flights", force: :cascade do |t|
    t.date     "dept_date"
    t.string   "dept_time"
    t.string   "airline"
    t.string   "flight_code"
    t.integer  "cost"
    t.integer  "from_id"
    t.integer  "to_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "flights", ["from_id"], name: "index_flights_on_from_id"
  add_index "flights", ["to_id"], name: "index_flights_on_to_id"

  create_table "passengers", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "booking_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "provider"
    t.string   "user_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
