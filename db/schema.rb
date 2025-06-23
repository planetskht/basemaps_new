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

ActiveRecord::Schema[8.0].define(version: 2025_06_23_171700) do
  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "attachments", force: :cascade do |t|
    t.string "attachable_type"
    t.integer "attachable_id"
    t.string "attach_type"
    t.string "name"
    t.string "attachment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bench_marks", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.integer "sub_project_id"
    t.string "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sub_project_id"], name: "index_bench_marks_on_sub_project_id"
  end

  create_table "coordinates", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "east_utm"
    t.string "north_utm"
    t.string "lattitude"
    t.string "longitude"
    t.string "time_zone"
    t.integer "sub_project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sub_project_id"], name: "index_coordinates_on_sub_project_id"
  end

  create_table "custom_menus", force: :cascade do |t|
    t.string "menu_name"
    t.string "sub_menu_name"
    t.string "attachment_type"
    t.integer "sub_project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sub_project_id"], name: "index_custom_menus_on_sub_project_id"
  end

  create_table "hydralic_particulars", force: :cascade do |t|
    t.string "from_km"
    t.string "to_km"
    t.string "title"
    t.text "description"
    t.integer "sub_project_id"
    t.string "type"
    t.string "hydralic_type", default: "Canal"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sub_project_id"], name: "index_hydralic_particulars_on_sub_project_id"
  end

  create_table "photos", force: :cascade do |t|
    t.string "type"
    t.string "attach_type"
    t.string "name"
    t.string "attachment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "projects", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "enabled", default: true
  end

  create_table "roles", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_roles_on_name", unique: true
  end

  create_table "site_maps", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "from_km"
    t.string "to_km"
    t.string "group_type"
    t.integer "sub_project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sub_project_id"], name: "index_site_maps_on_sub_project_id"
  end

  create_table "structure_drawings", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.integer "sub_project_id"
    t.string "type"
    t.string "group_type"
    t.string "structure_type"
    t.string "structure_label"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sub_project_id"], name: "index_structure_drawings_on_sub_project_id"
  end

  create_table "sub_projects", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_sub_projects_on_project_id"
  end

  create_table "user_roles", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "role_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id", "role_id"], name: "index_user_roles_on_user_id_and_role_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "role", default: "Guest"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "village_maps", force: :cascade do |t|
    t.string "title"
    t.text "village_name"
    t.string "map_type", default: "Village Map"
    t.integer "sub_project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sub_project_id"], name: "index_village_maps_on_sub_project_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "bench_marks", "sub_projects"
  add_foreign_key "coordinates", "sub_projects"
  add_foreign_key "custom_menus", "sub_projects"
  add_foreign_key "hydralic_particulars", "sub_projects"
  add_foreign_key "site_maps", "sub_projects"
  add_foreign_key "structure_drawings", "sub_projects"
  add_foreign_key "sub_projects", "projects"
  add_foreign_key "village_maps", "sub_projects"
end
