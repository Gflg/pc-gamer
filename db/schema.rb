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

ActiveRecord::Schema[7.0].define(version: 2022_10_10_000156) do
  create_table "graphics_cards", force: :cascade do |t|
    t.string "brand"
    t.string "model"
    t.integer "memory"
    t.string "memory_interface"
    t.float "length"
    t.string "interface"
    t.string "chipset"
    t.integer "base_clock"
    t.integer "clock_speed"
    t.string "frame_sync"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "motherboards", force: :cascade do |t|
    t.string "brand"
    t.string "model"
    t.string "chipset"
    t.string "form_factor"
    t.string "socket_type"
    t.integer "memory_slots"
    t.integer "max_memory_support"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "power_supplies", force: :cascade do |t|
    t.string "brand"
    t.string "model"
    t.integer "power"
    t.string "efficiency"
    t.string "color"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

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

  create_table "rams", force: :cascade do |t|
    t.string "brand"
    t.string "model"
    t.integer "size"
    t.string "ram_type"
    t.integer "speed"
    t.string "dimm_type"
    t.string "cas_latency"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "setups", force: :cascade do |t|
    t.string "name"
    t.integer "processor_id", null: false
    t.integer "motherboard_id", null: false
    t.integer "graphics_card_id", null: false
    t.integer "power_supply_id", null: false
    t.integer "ram_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["graphics_card_id"], name: "index_setups_on_graphics_card_id"
    t.index ["motherboard_id"], name: "index_setups_on_motherboard_id"
    t.index ["power_supply_id"], name: "index_setups_on_power_supply_id"
    t.index ["processor_id"], name: "index_setups_on_processor_id"
    t.index ["ram_id"], name: "index_setups_on_ram_id"
  end

  add_foreign_key "setups", "graphics_cards"
  add_foreign_key "setups", "motherboards"
  add_foreign_key "setups", "power_supplies"
  add_foreign_key "setups", "processors"
  add_foreign_key "setups", "rams"
end
