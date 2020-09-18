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

ActiveRecord::Schema.define(version: 2020_09_17_160040) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "blog_categorizations", force: :cascade do |t|
    t.bigint "blog_id"
    t.bigint "subcategory_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["blog_id"], name: "index_blog_categorizations_on_blog_id"
    t.index ["subcategory_id"], name: "index_blog_categorizations_on_subcategory_id"
  end

  create_table "blogs", force: :cascade do |t|
    t.string "title"
    t.string "teaser"
    t.text "body"
    t.boolean "motivation", default: false
    t.boolean "mindset", default: false
    t.boolean "resourcing", default: false
    t.boolean "planning", default: false
    t.boolean "time_management", default: false
    t.boolean "discipline", default: false
    t.string "image_url"
    t.text "pinterest_description"
    t.boolean "published", default: false
    t.datetime "published_at"
    t.boolean "approved", default: false
    t.boolean "featured", default: false
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "primary_category"
    t.bigint "resource_id"
    t.string "subcategory_id_list_string"
    t.string "slug"
    t.index ["resource_id"], name: "index_blogs_on_resource_id"
    t.index ["slug"], name: "index_blogs_on_slug", unique: true
    t.index ["user_id"], name: "index_blogs_on_user_id"
  end

  create_table "contacts", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "subject"
    t.text "message"
    t.boolean "archived", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "course_modules", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.bigint "course_id"
    t.boolean "active", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "teaser"
    t.string "video"
    t.string "goal"
    t.integer "sort"
    t.index ["course_id"], name: "index_course_modules_on_course_id"
  end

  create_table "course_registrations", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_course_registrations_on_course_id"
    t.index ["user_id"], name: "index_course_registrations_on_user_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string "name"
    t.decimal "price", precision: 8, scale: 2
    t.boolean "active", default: false
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "teaser"
    t.text "description"
    t.text "reviews"
    t.text "sp1"
    t.text "sp2"
    t.text "sp3"
    t.boolean "motivation", default: false
    t.boolean "mindset", default: false
    t.boolean "resourcing", default: false
    t.boolean "planning", default: false
    t.boolean "time_management", default: false
    t.boolean "discipline", default: false
    t.string "pinterest_description"
    t.boolean "featured", default: false
    t.integer "sort"
    t.index ["user_id"], name: "index_courses_on_user_id"
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_type", "sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_type_and_sluggable_id"
  end

  create_table "lesson_completions", force: :cascade do |t|
    t.bigint "lesson_id"
    t.bigint "user_id"
    t.boolean "started", default: true
    t.boolean "complete", default: false
    t.boolean "favorite", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lesson_id"], name: "index_lesson_completions_on_lesson_id"
    t.index ["user_id"], name: "index_lesson_completions_on_user_id"
  end

  create_table "lessons", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.text "body"
    t.string "video"
    t.bigint "course_module_id"
    t.boolean "active", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "teaser"
    t.string "goal"
    t.integer "sort"
    t.text "assignment"
    t.text "materials"
    t.string "attachment_name"
    t.integer "order_in_module"
    t.index ["course_module_id"], name: "index_lessons_on_course_module_id"
  end

  create_table "preauthorizations", force: :cascade do |t|
    t.string "email"
    t.boolean "admin", default: false
    t.boolean "contributor", default: false
    t.boolean "fulfilled", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "resources", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.boolean "general", default: false
    t.boolean "motivation", default: false
    t.boolean "mindset", default: false
    t.boolean "resourcing", default: false
    t.boolean "planning", default: false
    t.boolean "time_management", default: false
    t.boolean "discipline", default: false
    t.string "resource_type"
    t.string "link_url"
    t.boolean "active", default: true
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "classification"
    t.index ["user_id"], name: "index_resources_on_user_id"
  end

  create_table "subcategories", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "motivation", default: false
    t.boolean "mindset", default: false
    t.boolean "resourcing", default: false
    t.boolean "planning", default: false
    t.boolean "time_management", default: false
    t.boolean "discipline", default: false
    t.string "blog_id_list_string"
    t.boolean "general", default: false
  end

  create_table "subscribers", force: :cascade do |t|
    t.string "first_name"
    t.string "email"
    t.boolean "member", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "unsubscribed", default: false
    t.text "resource_id_array", default: [], array: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "first_name"
    t.string "last_name"
    t.string "membership", default: "Free"
    t.boolean "contributor", default: false
    t.boolean "admin", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "bio"
    t.string "full_title"
    t.string "website"
    t.datetime "contributor_since"
    t.string "location"
    t.string "job_title"
    t.string "company"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "blogs", "resources"
  add_foreign_key "blogs", "users"
  add_foreign_key "course_modules", "courses"
  add_foreign_key "course_registrations", "courses"
  add_foreign_key "course_registrations", "users"
  add_foreign_key "courses", "users"
  add_foreign_key "lesson_completions", "lessons"
  add_foreign_key "lesson_completions", "users"
  add_foreign_key "lessons", "course_modules"
  add_foreign_key "resources", "users"
end
