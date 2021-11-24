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

ActiveRecord::Schema.define(version: 2021_09_16_173050) do

  create_table "admins", force: :cascade do |t|
    t.string "login"
    t.string "password_digest"
    t.index ["login"], name: "index_admins_on_login", unique: true
  end

  create_table "lesson_teachers", force: :cascade do |t|
    t.integer "lesson_id", null: false
    t.integer "teacher_id", null: false
    t.index ["lesson_id"], name: "index_lesson_teachers_on_lesson_id"
    t.index ["teacher_id"], name: "index_lesson_teachers_on_teacher_id"
  end

  create_table "lessons", force: :cascade do |t|
    t.string "name", null: false
    t.index ["name"], name: "index_lessons_on_name", unique: true
  end

  create_table "schedules", force: :cascade do |t|
    t.string "class_id", null: false
    t.string "week_day", null: false
    t.time "t_start", null: false
    t.time "t_end", null: false
    t.integer "lesson_id", null: false
    t.integer "teacher_id", null: false
    t.index ["class_id", "week_day", "t_start", "t_end"], name: "index_schedules_on_class_id_and_week_day_and_t_start_and_t_end"
    t.index ["lesson_id"], name: "index_schedules_on_lesson_id"
    t.index ["teacher_id"], name: "index_schedules_on_teacher_id"
  end

  create_table "teachers", force: :cascade do |t|
    t.string "FIO", null: false
    t.index ["FIO"], name: "index_teachers_on_FIO"
  end

  add_foreign_key "lesson_teachers", "lessons"
  add_foreign_key "lesson_teachers", "teachers"
end
