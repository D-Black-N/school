# класс управляющий удалением предметов из базы данных
class DestroySubject < BaseInteractor
  # вызов
  def call(subj_id)

    # поиск необходимых параметров для удаления предметов
    subj = Lesson.find(subj_id)
    teacher = LessonTeacher.find_by_lesson_id(subj_id)
    schedule = Schedule.find_by_lesson_id(subj_id)

    # проверка отсутствия связей с таблицами преподавателей и расписания
    if teacher.nil? && schedule.nil?   
      subj.destroy
      true
    else
      false
    end
  end
end