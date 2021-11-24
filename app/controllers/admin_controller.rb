# Контроллер для интерфейса администратора
class AdminController < ApplicationController
  before_action :check_login  # перед вызовом любого метода контроллера вызывается метод check_login для проверки сессии администратора

  # домашняя страница, главное меню
  def index
    
  end

  # страница редактирования администратора
  def passwd
    @admin = Admin.find_by(id: session[:admin_id]) # получение данных об администраторе из базы данных по ключу сессии
  end

  # обновление данных администратора
  def update_admin
    admin = Admin.find(params[:admin][:id])
    admin.update(update_admin_params) # обновление данных администратора
    # генерация данных для отправки клиенту
    respond_to do |format|
      if admin.save
        format.html { redirect_to admin_passwd_path }
        format.json { render json: admin } # генерирует данные в формате json 
      else
        format.html {redirect_to admin_passwd_path, message: "Ошибка обновления" }
        format.json { render json: error_update_admin } # генерирует данные в формате json 
      end
    end  
  end

# медоты, работающие с расписанием
  
  # отображение существующих учебных классов (заполнено их расписание)
  def schedule
    s_array = Schedule.group(:class_id).order(:class_id)
                      .map { |elem| elem.class_id }
    @classes = s_array.map { |val| s_array.select { |el| el[1] == val[1] } }.uniq  
    @message = params[:error] || "" 
  end

  # данные, необходимые для отображения страницы создания расписания для нового класса
  def new_schedule
    @new_schedule = Schedule.new
    @lessons = Lesson.all
    @teachers = Teacher.all
    @week = ["Понедельник", "Вторник", "Среда", "Четверг", "Пятница"]
  end

  # добавление расписания в базу данных
  def add_schedule
    schedule_init = CreateSchedule.call(schedule_params) # добавление в базу данных
    # генерация данных для отправки клиенту
    respond_to do |format|
      unless schedule_init.has_key? :error
        format.html { redirect_to admin_schedule_path }
        format.json { render json: schedule_init } # генерирует данные в формате json
      else
        format.html { redirect_to admin_schedule_path(error: schedule_init[:error]) }
        format.json { render json: [schedule_init, schedule_params] } # генерирует данные в формате json 
      end
    end
  end

  # данные для отображения страницы обновления расписания класса
  def update_class
    @week = ["Понедельник", "Вторник", "Среда", "Четверг", "Пятница"]
    @schedule_class = Schedule.where(class_id: params[:class_id])
    @lessons = Lesson.all
    @teachers = Teacher.all
  end

  # метод удаления всего расписания
  def destroy_all_schedules 
    Schedule.delete_all
  end

  # удаление расписания отдельного класса
  def desroy_class_schedule
  
  end

# методы, работающие со школьными предметами
  
  # страница отображения учебных предметов, получение необходимых данных для нее
  def subject
    @error = params[:err]
    @lessons = Lesson.all.order(:name) # полчение предметов в алфавитном порядке
    @new_lesson = Lesson.new
    # генерация данных для отправки клиенту
    respond_to do |format|
      format.html
      format.json { render json: @lessons } # генерирует данные в формате json
    end
  end

  # добавление нового предмета в базу данных
  def add_subject
    subj = Lesson.new(subject_params) # создание нового объекта 
    # генерация данных для отправки клиентуr
    respond_to do |format|
      if subj.save                    # проверка валидации и сохранение объекта в базу данных
        format.html { redirect_to admin_subject_path }  # перенаправление на страницу учебных предметов
        format.json { render json: subj } # генерирует данные в формате json 
      else
        format.html { redirect_to admin_subject_path }  # перенаправление на страницу учебных предметов
        format.json { render json: [subj, subject_params] } # генерирует данные в формате json 
      end  
    end
  end
  
  # метод удаления предмета из списка
  def destroy_subject
    destroy_res = DestroySubject.call(params[:id])  # вызов метода удаления
    # генерация данных для отправки клиенту 
    respond_to do |format|
      if destroy_res
        format.html { redirect_to admin_subject_path }       # перенаправление на страницу учебных предметов
        format.json { render json: "Данные успешно удалены"} # генерирует данные в формате json 
      else
        format.html { redirect_to admin_subject_path(err: destroy_res) } # перенаправление на страницу предметов с выдачей ошибки
        format.json { render json: "Невозможно удалить данные" } # генерирует данные в формате json 
      end
    end
  end

# методы, работающие с преподавателями
  
  # данные, необходимые для отображения страницы преподавателей
  def teacher
    @teachers = Teacher.all
    @new_teacher = Teacher.new
    @new_teacher.lessons.build # создание зависимости преподвателей и предметов через таблицу
    @lessons = Lesson.all
    # генерация данных для отправки клиенту
    respond_to do |format|
      format.js     # формат, необходимый для AJAX запросов
      format.html
    end
  end

  # добавление нового преподавателя в базу данных
  def add_teacher
    teacher = CreateTeachers.call(teacher_params) # добавление нового преподавателя в БД
    # генерация данных для отправки клиенту
    respond_to do |format|
      unless teacher.nil?
        format.html { redirect_to admin_teacher_path } # перенаправление на страницу преподавателей
        format.json { render json: teacher } # генерирует данные в формате json
      else
        format.html { redirect_to admin_teacher_path } # перенаправление на страницу преподавателей
        format.json { render json: teacher_params } # генерирует данные в формате json
      end
    end
  end

  # метод удаления преподавателей из базы данных
  def destroy_teacher
    destroy_res = DestroyTeacher.call(params[:id]) # вызов специального метода удаления
    # генерация данных для отправки клиенту
    respond_to do |format|
      if destroy_res
        format.html { redirect_to admin_teacher_path }  # перенаправление на страницу преподавателей
        format.json { render json: "Данные успешно удалены"} # генерирует данные в формате json
      else
        format.html { redirect_to admin_teacher_path(err: destroy_res) } # перенаправление на страницу предметов с выдачей ошибки
        format.json { render json: "Невозможно удалить преподавателя"} # генерирует данные в формате json
      end
    end
  end

  # обновление данных о преподавателе
  def update_teacher
    @teacher = Teacher.find_by(id: params[:id])
    @lessons = Lesson.all

  end

  private 

  # Хеш, разрешающий параметры имени предмета для добавления в базу данных
  def subject_params
    params.require(:lesson).permit(:name)
  end

  # Хеш, разрешающий параметры ФИО и ID предметов для добавления в базу данных преподавателя
  def teacher_params 
    params.require(:teacher).permit(:FIO, lessons_attributes: [:id])
  end

  # Хеш, разрешающий параметры при создании расписания класса
  def schedule_params
    params.require(:schedule).permit!
  end

  # Хеш, разрешающий параметры данных администратора для обновления
  def update_admin_params
    params.require(:admin).permit(:id, :login, :password, :password_confirmation)
  end
end
