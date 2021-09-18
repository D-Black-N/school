class AddIndexToLessonsName < ActiveRecord::Migration[6.1]
  def change
    add_index :lessons, :name, unique: true

  end
end
