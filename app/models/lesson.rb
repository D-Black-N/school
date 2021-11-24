class Lesson < ApplicationRecord
  # Связь многие-ко-многим с таблицей Преподватели
  has_many :lesson_teachers
  has_many :teachers, through: :lesson_teachers # Использование дополнительной таблицы lesson_teachers для связи

  # связь один-ко-многим с таблицей расписания
  has_many :schedules
  
  # разрешение атрибутов предметов и расписания (для связи многие-ко-многим)
  accepts_nested_attributes_for :teachers 

  # Валидация полей при работе с данными
  validates :name, presence: true

end
