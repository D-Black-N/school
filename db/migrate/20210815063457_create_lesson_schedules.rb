class CreateLessonSchedules < ActiveRecord::Migration[6.1]
  def change
    create_table :lesson_schedules do |t|
      t.references :lesson, index: true, foreign_key: true, null: false
      t.references :schedule, index: true, foreign_key: true, null: false

    end
  end
end
