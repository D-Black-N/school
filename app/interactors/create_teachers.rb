# класс, управляющий созданием преподавателей
class CreateTeachers < BaseInteractor

	# вызов
	def call(teacher_params)
		
		lesson_keys = teacher_params[:lessons_attributes].select {|key, val| val[:id] != "" } # отбор не пустых параметров предметов для создания зависимостей
    	teacher = Teacher.new(FIO: teacher_params[:FIO])
    
		# сохранение нового преподавателя
		if teacher.save
			
			# цикл по всем элементам предметов
			lesson_keys.each_value do |val|
      	
				subject = Lesson.find(val[:id])	# поиск предмета в таблице предметов
      	link = LessonTeacher.new(lesson: subject, teacher: teacher)	# создание зависимости в таблице lesson_teachers
      	
				# сохранение зависимости
				unless link.save
      	  return nil
      	end
      end
    else 
      return nil
    end
	end
end