class AddIndexToSchedules < ActiveRecord::Migration[6.1]
  def change
    add_index :schedules, [:class_id, :week_day, :t_start, :t_end]

  end
end
