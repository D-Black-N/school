class DestroyTeacher < BaseInteractor
  def call(teacher_id)
    teacher = Teacher.find(teacher_id)
    teacher_lessons = LessonTeacher.where(teacher_id: teacher_id)
    teacher_shedules = ScheduleTeacher.find_by_teacher_id(teacher_id)
    if teacher_shedules.nil?
      teacher_lessons.each { |subj| subj.destroy }
      teacher.destroy
      true
    else
      false
    end
  end
end