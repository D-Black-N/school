class CreateSchedules < ActiveRecord::Migration[6.1]
  def change
    create_table :schedules do |t|
      t.string :class_id, null: false
      t.string :week_day, null: false
      t.time :t_start, null: false
      t.time :t_end, null: false

    end
  end
end
