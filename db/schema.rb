ActiveRecord::Schema.define(version: 20151014122235) do

  create_table "airports", force: :cascade do |t|
    t.string   "name"
    t.string   "country"
    t.string   "city"
    t.string   "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bookings", force: :cascade do |t|
    t.datetime "booking_time"
    t.integer  "no_of_pass"
    t.date     "return_time"
    t.integer  "adult"
    t.integer  "children"
    t.integer  "flight_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "flights", force: :cascade do |t|
    t.date     "dept_time"
    t.string   "airline"
    t.integer  "cost"
    t.string   "from_id"
    t.string   "to_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "passengers", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "provider"
    t.string   "user_id"
    t.integer  "booking_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
