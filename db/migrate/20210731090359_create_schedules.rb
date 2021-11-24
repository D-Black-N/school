class CreateSchedules < ActiveRecord::Migration[6.1]
  def change
    create_table :schedules do |t|
      t.string :class_id, null: false
      t.string :week_day, null: false
      t.time :t_start, null: false
      t.time :t_end, null: false
      t.integer :lesson_id, null: false, index: true, foreign_key: true
      t.integer :teacher_id, null: false, index: true, foreign_key: true

    end
    #Ex:- add_index("admin_users", "username")
  end
end
