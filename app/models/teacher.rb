class Teacher < ApplicationRecord
  has_many :lesson_teachers
  has_many :lessons, through: :lesson_teachers
  accepts_nested_attributes_for :lessons
  # belongs_to :schedule, class_name: "schedule", foreign_key: "schedule_id"
  # validates_length_of :FIO, within: 3..30, on: :create, message: "must be present"

end
