class Schedule < ApplicationRecord
  # many-to-many with lessons and teachers tables
  has_many :lesson_schedules
  has_many :lessons, through: :lesson_schedules

  # many-to-many with lessons and teachers tables
  has_many :schedule_teachers
  has_many :teachers, through: :schedule_teachers

  accepts_nested_attributes_for :lessons
  accepts_nested_attributes_for :teachers

  # validation for Schedule
  validates :class_id, length: { in: 1..3 }
  validates :week_day, length: { in: 5..11 }
  validates :t_start, :t_end, presence: true

  # new init function
  def init_with_teach_les(hash)
    class_id = hash[:class_id]
    hash[:week_days].each_value do |value|
      day = value[:day]
      value[:lessons].each_value do |elem|
        if elem[:subject][:id] != "" && elem[:teacher][:id] != ""
          start_at = "#{elem[:t_start]['time(4i)']}:#{elem[:t_start]['time(5i)']}"
          end_at = "#{elem[:t_end]['time(4i)']}:#{elem[:t_end]['time(5i)']}"
          new_schedule = Schedule.new(class_id: class_id, 
                                      week_day: day, 
                                      t_start: start_at, 
                                      t_end: end_at)
          if new_schedule.save
            subject = Lesson.find(elem[:subject][:id])
            teacher = Teacher.find(elem[:teacher][:id])
            if subject && teacher
              sh_th = ScheduleTeacher.new(schedule: new_schedule, teacher: teacher)
              les_sh = LessonSchedule.new(lesson: subject, schedule: new_schedule)
              unless sh_th.save && les_sh.save
                return nil
              end
            else
              return nil
            end
          else
            return nil
          end
        end
      end
    end
  end
end
