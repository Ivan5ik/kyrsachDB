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

ActiveRecord::Schema[7.0].define(version: 2023_04_23_162001) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "administrators", force: :cascade do |t|
    t.string "name", null: false
    t.string "surname", null: false
    t.string "email", null: false
    t.string "phone_number", null: false
    t.string "position", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cars", force: :cascade do |t|
    t.string "brand", null: false
    t.string "model", null: false
    t.integer "graduation_year", null: false
    t.integer "year_license_plate", null: false
    t.integer "tank_volume", null: false
    t.float "engine_power", null: false
    t.string "type_fuel", null: false
    t.bigint "client_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clients", force: :cascade do |t|
    t.string "name", null: false
    t.string "surname", null: false
    t.string "email", null: false
    t.string "phone_number", null: false
    t.string "address", null: false
    t.string "credit_card", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "current_date_transactions", force: :cascade do |t|
    t.bigint "client_id", null: false
    t.string "loyalty_program_id", null: false
    t.integer "count_bonus", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "fuels", force: :cascade do |t|
    t.string "type_fuel", null: false
    t.decimal "price", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "gas_stations", force: :cascade do |t|
    t.string "address", null: false
    t.integer "count_availability", null: false
    t.bigint "history_order", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "loyalty_programs", force: :cascade do |t|
    t.string "name", null: false
    t.integer "bonus_count", null: false
    t.datetime "start_date", null: false
    t.datetime "end_date", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "transactions", force: :cascade do |t|
    t.bigint "client_id", null: false
    t.bigint "car_id", null: false
    t.bigint "gas_station_id", null: false
    t.bigint "fuel_id", null: false
    t.integer "fuel_volume", null: false
    t.datetime "datatime_refueling", null: false
    t.bigint "total_cost", null: false
    t.bigint "administrator_id", null: false
  end

  create_table "user_loyalty_programs", force: :cascade do |t|
    t.bigint "client_id", null: false
    t.bigint "loyalty_program_id", null: false
    t.integer "count_bonus", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
