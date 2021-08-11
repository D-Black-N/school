class LessonTeacher < ApplicationRecord
  belongs_to :lesson
  belongs_to :teacher
end
