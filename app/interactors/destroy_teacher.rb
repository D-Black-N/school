# класс управляющий удалением преподавателей из базы данных
class DestroyTeacher < BaseInteractor
  # вызов
  def call(teacher_id)

    teacher = Teacher.find(teacher_id)
    teacher_lessons = LessonTeacher.where(teacher_id: teacher_id)     # поиск связей между преподавателем и предметами
    teacher_shedules = Schedule.find_by_teacher_id(teacher_id) # поиск наличия связи с расписанием
    
    # проверка отсутствия связей преподавателя с расписанием в БД
    if teacher_shedules.nil?
      teacher_lessons.each { |subj| subj.delete } # удаление зависимостей в таблице связи преподавателей и предметов
      teacher.delete # удаление преподавателя
      true
    else
      false
    end
  end
end