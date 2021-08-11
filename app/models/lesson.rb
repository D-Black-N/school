class Lesson < ApplicationRecord
  has_many :lesson_teachers
  has_many :teachers, through: :lesson_teachers
  # belongs_to :schedule, class_name: "schedule"
end
