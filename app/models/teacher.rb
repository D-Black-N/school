class Teacher < ApplicationRecord

  # связь многие-ко-многим между предметами и преподавателями через таблицу lesson_teacher
  has_many :lesson_teachers
  has_many :lessons, through: :lesson_teachers

  # связь один-ко-многим с таблицей расписания
  has_many :schedules

  # разрешение атрибутов предметов (для связи многие-ко-многим)
  accepts_nested_attributes_for :lessons

  # валидация поля ФИО преподавателя
  validates :FIO, format: { with: /[А-Я][а-я]+\s[А-Я]\.[А-Я]\./ }
end
