class CreateScheduleTeachers < ActiveRecord::Migration[6.1]
  def change
    create_table :schedule_teachers do |t|
      t.references :schedule, index: true, foreign_key: true, null: false
      t.references :teacher, index: true, foreign_key: true, null: false

    end
  end
end
