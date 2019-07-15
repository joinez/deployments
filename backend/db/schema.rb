# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_07_13_202419) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clouds", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "current_versions", force: :cascade do |t|
    t.string "version"
    t.bigint "environment_id", null: false
    t.bigint "deployment_id", null: false
    t.bigint "service_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["deployment_id"], name: "index_current_versions_on_deployment_id"
    t.index ["environment_id"], name: "index_current_versions_on_environment_id"
    t.index ["service_id"], name: "index_current_versions_on_service_id"
  end

  create_table "deployments", force: :cascade do |t|
    t.string "build_url"
    t.boolean "success"
    t.integer "duration"
    t.bigint "environment_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["environment_id"], name: "index_deployments_on_environment_id"
  end

  create_table "environments", force: :cascade do |t|
    t.string "name"
    t.bigint "cloud_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cloud_id"], name: "index_environments_on_cloud_id"
  end

  create_table "services", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "current_versions", "deployments"
  add_foreign_key "current_versions", "environments"
  add_foreign_key "current_versions", "services"
  add_foreign_key "deployments", "environments"
  add_foreign_key "environments", "clouds"
end
