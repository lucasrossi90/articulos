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

ActiveRecord::Schema.define(version: 2020_06_15_184852) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "articulos", force: :cascade do |t|
    t.integer "interno"
    t.string "codigo", null: false
    t.string "descripcion"
    t.string "proveedor_id", default: "2", null: false
    t.decimal "costo", default: "0.0", null: false
    t.date "fecha_precio"
    t.decimal "precio", default: "0.0", null: false
    t.text "comentarios"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "rubro_id"
    t.string "ubicacion"
    t.decimal "ganancia", default: "0.0", null: false
    t.index ["interno"], name: "index_articulos_on_interno", unique: true
  end

  create_table "movimiento_stocks", force: :cascade do |t|
    t.string "tipoMovimiento"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "proveedor_id"
  end

  create_table "producto_movidos", force: :cascade do |t|
    t.integer "interno"
    t.integer "proveedor"
    t.datetime "fecha"
    t.integer "cantidad"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "codigo"
    t.string "descripcion"
    t.integer "movimiento_stock_id"
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
