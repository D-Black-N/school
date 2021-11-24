# модель для связи предметов и преподавателей
class LessonTeacher < ApplicationRecord
  # отношение принадлежности к таблицам предметов и преподавателей
  belongs_to :lesson  
  belongs_to :teacher
end
