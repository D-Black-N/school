class CreateSchedules < ActiveRecord::Migration[6.1]
  def change
    create_table :schedules do |t|
      t.string :class_id, null: false
      t.integer :lesson_id, null: false
      t.time :t_start, null: false
      t.time :t_end, null: false
      t.integer :teacher_id, null: false
      t.string :week_day, null: false

    end
  end
end
