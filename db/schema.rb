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

ActiveRecord::Schema.define(version: 2019_02_08_150156) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "articulos", force: :cascade do |t|
    t.integer "interno"
    t.string "codigo"
    t.string "descripcion"
    t.string "proveedor_id"
    t.decimal "costo"
    t.date "fecha_precio"
    t.decimal "precio"
    t.text "comentarios"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "rubro_id"
    t.string "ubicacion"
    t.decimal "ganancia"
    t.index ["interno"], name: "index_articulos_on_interno", unique: true
  end

  create_table "proveedors", force: :cascade do |t|
    t.string "nombre"
    t.string "descuento"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rubros", force: :cascade do |t|
    t.string "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["id"], name: "index_rubros_on_id", unique: true
  end

end
