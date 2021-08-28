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

ActiveRecord::Schema.define(version: 2021_08_15_063506) do

  create_table "lesson_schedules", force: :cascade do |t|
    t.integer "lesson_id", null: false
    t.integer "schedule_id", null: false
    t.index ["lesson_id"], name: "index_lesson_schedules_on_lesson_id"
    t.index ["schedule_id"], name: "index_lesson_schedules_on_schedule_id"
  end

  create_table "lesson_teachers", force: :cascade do |t|
    t.integer "lesson_id", null: false
    t.integer "teacher_id", null: false
    t.index ["lesson_id"], name: "index_lesson_teachers_on_lesson_id"
    t.index ["teacher_id"], name: "index_lesson_teachers_on_teacher_id"
  end

  create_table "lessons", force: :cascade do |t|
    t.string "name", null: false
  end

  create_table "schedule_teachers", force: :cascade do |t|
    t.integer "schedule_id", null: false
    t.integer "teacher_id", null: false
    t.index ["schedule_id"], name: "index_schedule_teachers_on_schedule_id"
    t.index ["teacher_id"], name: "index_schedule_teachers_on_teacher_id"
  end

  create_table "schedules", force: :cascade do |t|
    t.string "class_id", null: false
    t.string "week_day", null: false
    t.time "t_start", null: false
    t.time "t_end", null: false
  end

  create_table "teachers", force: :cascade do |t|
    t.string "FIO", null: false
  end

  add_foreign_key "lesson_schedules", "lessons"
  add_foreign_key "lesson_schedules", "schedules"
  add_foreign_key "lesson_teachers", "lessons"
  add_foreign_key "lesson_teachers", "teachers"
  add_foreign_key "schedule_teachers", "schedules"
  add_foreign_key "schedule_teachers", "teachers"
end
