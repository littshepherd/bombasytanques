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

ActiveRecord::Schema[7.0].define(version: 2023_03_23_225711) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accions", force: :cascade do |t|
    t.string "tipo_accion"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ahorro_seguridad_socials", force: :cascade do |t|
    t.decimal "valor"
    t.text "comentario"
    t.bigint "accion_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["accion_id"], name: "index_ahorro_seguridad_socials_on_accion_id"
    t.index ["user_id"], name: "index_ahorro_seguridad_socials_on_user_id"
  end

  create_table "ahorros", force: :cascade do |t|
    t.string "nombre_ahorro"
    t.decimal "valor"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_ahorros_on_user_id"
  end

  create_table "capitalizacions", force: :cascade do |t|
    t.decimal "cantidad"
    t.text "comentario"
    t.bigint "accion_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["accion_id"], name: "index_capitalizacions_on_accion_id"
    t.index ["user_id"], name: "index_capitalizacions_on_user_id"
  end

  create_table "ivas", force: :cascade do |t|
    t.decimal "valor"
    t.text "comentario"
    t.bigint "accion_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["accion_id"], name: "index_ivas_on_accion_id"
    t.index ["user_id"], name: "index_ivas_on_user_id"
  end

  create_table "pago_seguridad_socials", force: :cascade do |t|
    t.decimal "valor"
    t.text "comentario"
    t.bigint "user_id", null: false
    t.bigint "persona_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["persona_id"], name: "index_pago_seguridad_socials_on_persona_id"
    t.index ["user_id"], name: "index_pago_seguridad_socials_on_user_id"
  end

  create_table "tipo_movimientos", force: :cascade do |t|
    t.string "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "nombre", null: false
    t.string "email", null: false
    t.string "password_digest", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "ahorro_seguridad_socials", "accions"
  add_foreign_key "ahorro_seguridad_socials", "users"
  add_foreign_key "ahorros", "users"
  add_foreign_key "capitalizacions", "accions"
  add_foreign_key "capitalizacions", "users"
  add_foreign_key "ivas", "accions"
  add_foreign_key "ivas", "users"
  add_foreign_key "pago_seguridad_socials", "users"
  add_foreign_key "pago_seguridad_socials", "users", column: "persona_id"
end
