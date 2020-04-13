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

ActiveRecord::Schema.define(version: 20200413214000) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name"
  end

  create_table "inscriptions", force: :cascade do |t|
    t.bigint "job_id"
    t.bigint "user_id"
    t.index ["job_id"], name: "index_inscriptions_on_job_id"
    t.index ["user_id"], name: "index_inscriptions_on_user_id"
  end

  create_table "job_types", force: :cascade do |t|
    t.string "name"
  end

  create_table "jobs", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "url"
    t.string "location"
    t.string "job_author"
    t.boolean "remote_ok"
    t.string "apply_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "avatar"
    t.integer "budget"
    t.boolean "open"
    t.integer "awarded_proposal"
    t.bigint "category_id"
    t.float "latitude"
    t.float "longitude"
    t.bigint "job_type_id"
    t.datetime "expiry_date"
    t.bigint "user_id"
    t.index ["category_id"], name: "index_jobs_on_category_id"
    t.index ["job_type_id"], name: "index_jobs_on_job_type_id"
    t.index ["user_id"], name: "index_jobs_on_user_id"
  end

  create_table "taggings", force: :cascade do |t|
    t.bigint "job_id"
    t.bigint "tag_id"
    t.index ["job_id"], name: "index_taggings_on_job_id"
    t.index ["tag_id"], name: "index_taggings_on_tag_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
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
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "stripe_id"
    t.string "card_brand"
    t.string "card_last4"
    t.string "card_exp_month"
    t.string "card_exp_year"
    t.datetime "expires_at"
    t.boolean "admin"
    t.string "provider"
    t.string "uid"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "inscriptions", "jobs"
  add_foreign_key "inscriptions", "users"
  add_foreign_key "jobs", "categories"
  add_foreign_key "jobs", "job_types"
  add_foreign_key "jobs", "users"
  add_foreign_key "taggings", "jobs"
  add_foreign_key "taggings", "tags"
end
