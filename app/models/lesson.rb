class Lesson < ApplicationRecord
  # many-to-many with lessons and teachers tables
  has_many :lesson_teachers
  has_many :teachers, through: :lesson_teachers

  # many-to-many with lessons and teachers tables
  has_many :schedules
  has_many :schedules, through: :lesson_schedules

  accepts_nested_attributes_for :teachers
  accepts_nested_attributes_for :schedules

  # validation
  validates :name, presence: true

end
