class CreateLessonTeachers < ActiveRecord::Migration[6.1]
  def change
    create_table :lesson_teachers do |t|
      t.references :lesson, index: true, foreign_key: true, null: false
      t.references :teacher, index: true, foreign_key: true, null: false

    end
  end
end
