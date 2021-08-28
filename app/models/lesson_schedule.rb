class LessonSchedule < ApplicationRecord
  belongs_to :lesson
  belongs_to :schedule
end
