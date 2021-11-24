# модель расписания классов 
class Schedule < ApplicationRecord

  # отношение принадлежности к предметам и преподавателям
  belongs_to :teacher, foreign_key: "teacher_id"
  belongs_to :lesson, foreign_key: "lesson_id"

  # Валидация полей при работе с данными модели
  validates :class_id, length: { in: 1..3 }
  validates :week_day, length: { in: 5..11 }
  validates :t_start, :t_end, presence: true
end
