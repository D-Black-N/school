# класс, управляющий созданием расписания класса
class CreateSchedule < BaseInteractor

	# вызов
	def call(schedule_params)
		
		class_id = schedule_params[:class_id] # получение поля class_id
		
		# цикл по всем дням недели
    	schedule_params[:week_days].each_value do |value|
      
			day = value[:day]	# получение дня недели
			
			# цикл по всем урокам в дне недели
      		value[:lessons].each_value do |elem|
        	if elem[:subject][:id] != "" && elem[:teacher][:id] != "" # проверка на не пустые данные предмета и преподавателя
					
				# преобразование времени для сохранения в БД
          		start_at = "#{elem[:t_start]['time(4i)']}:#{elem[:t_start]['time(5i)']}" 
          		end_at 	 = "#{elem[:t_end]['time(4i)']}:#{elem[:t_end]['time(5i)']}"

				# поиск в расписании преподвателя в определенное время дня недели
				unless Schedule.find_by(teacher_id: elem[:teacher][:id], t_start: start_at, week_day: day)  
					# создание урока
          			new_schedule = Schedule.new(class_id: class_id, 
												week_day: day, 
												t_start: start_at, 
												t_end: end_at, 
												lesson_id: elem[:subject][:id],
												teacher_id: elem[:teacher][:id])
						
					# сохранение урока и проверка валидации
					unless new_schedule.save
          	  		  return {error: "Неправильно введены данные"}
          			end
				else
				  return {error: "Преподаватель, #{Teacher.find(elem[:teacher][:id]).FIO}, занят в #{day} с #{start_at} до #{end_at}, выберите другого"}
				end
        end
      end
    end
	end
end