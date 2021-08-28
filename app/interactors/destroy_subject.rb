class DestroySubject < BaseInteractor
  def call(subj_id)
    subj = Lesson.find(subj_id)
    teacher = LessonTeacher.find_by_lesson_id(subj_id)
    schedule = LessonSchedule.find_by_lesson_id(subj_id)
    if teacher.nil? && schedule.nil?
      subj.destroy
      true
    else
      false
    end
  end
end