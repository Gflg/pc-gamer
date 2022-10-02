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

ActiveRecord::Schema[7.0].define(version: 2022_10_02_161654) do
  create_table "processors", force: :cascade do |t|
    t.string "brand"
    t.string "model"
    t.integer "cores"
    t.integer "threads"
    t.string "socket_type"
    t.float "base_speed"
    t.float "turbo_speed"
    t.string "architechture"
    t.string "integrated_graphics"
    t.string "memory_type"
    t.integer "memory_frequency"
    t.string "series"
    t.string "generation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "core_family"
  end

end
