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

ActiveRecord::Schema.define(version: 20171218183639) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "achievements", force: :cascade do |t|
    t.integer "proficiency_level_id"
    t.string "name"
  end

  create_table "classrooms", force: :cascade do |t|
    t.string "name"
    t.integer "teacher_id"
  end

  create_table "pages", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "proficiency_levels", force: :cascade do |t|
    t.integer "level"
    t.string "statement", null: false
  end

  create_table "skill_levels", force: :cascade do |t|
    t.string "level"
    t.string "statement"
    t.integer "skill_id"
    t.integer "proficiency_level_id"
  end

  create_table "skills", force: :cascade do |t|
    t.string "name"
    t.integer "subject_id"
  end

  create_table "student_skill_levels", force: :cascade do |t|
    t.integer "student_id"
    t.integer "skill_level_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "first_name"
    t.string "la st_name"
    t.string "special_education_need"
    t.integer "classroom_id"
    t.integer "year"
    t.boolean "pupil_premium"
    t.boolean "free_school_meals"
    t.boolean "english_as_language"
    t.boolean "gender"
  end

  create_table "subjects", force: :cascade do |t|
    t.string "name"
  end

  create_table "teachers", force: :cascade do |t|
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
    t.string "first_name"
    t.string "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false, null: false
    t.index ["email"], name: "index_teachers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_teachers_on_reset_password_token", unique: true
  end

end
