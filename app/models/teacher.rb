class Teacher < ApplicationRecord
  # many-to-many with lessons and teachers tables
  has_many :lesson_teachers
  has_many :lessons, through: :lesson_teachers

  # many-to-many with schedules and teachers tables
  has_many :schedule_teachers
  has_many :schedules, through: :schedule_teachers

  accepts_nested_attributes_for :lessons

  # validation
  validates :FIO, format: { with: /[А-Я][а-я]+\s[А-Я]\.[А-Я]\./ }

  # new init function
  def lesson_init(hash)
    lesson_keys = hash[:lessons_attributes].select {|key, val| val[:id] != "" }
    teacher = Teacher.new(FIO: hash[:FIO])
    if teacher.save
      lesson_keys.each_value do |val|
        subject = Lesson.find(val[:id])
        link = LessonTeacher.new(lesson: subject, teacher: teacher)
        unless link.save
          return nil
        end
      end
    else 
      return nil
    end
  end

end
