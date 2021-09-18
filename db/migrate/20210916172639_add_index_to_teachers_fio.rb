class AddIndexToTeachersFio < ActiveRecord::Migration[6.1]
  def change
    add_index :teachers, :FIO
  end
end
