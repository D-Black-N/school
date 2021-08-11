class Schedule < ApplicationRecord
  has_many :lessons, class_name: "lesson"
  has_many :teachers, class_name: "teacher"
end
