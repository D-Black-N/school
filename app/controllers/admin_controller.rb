class AdminController < ApplicationController
  before_action :check_login

  # домашняя страница, главное меню
  def index
    
  end

  # страница редактирования администратора
  def passwd
    @admin = Admin.find_by(id: session[:admin_id])
  end

  # обновление данных администратора
  def update_admin
    admin = Admin.find(params[:admin][:id])
    admin.update(update_admin_params)
    respond_to do |format|
      if admin.save
        format.html { redirect_to admin_passwd_path }
        format.json { render json: admin }
      else
        format.html {redirect_to admin_passwd_path, message: "Ошибка обновления" }
        format.json { render json: error_update_admin }
      end
    end  
  end

  # медоты, работающие с расписанием
  def schedule
    s_array = Schedule.group(:class_id).order(:class_id)
                      .map { |elem| elem.class_id }
    @classes = s_array.map { |val| s_array.select { |el| el[1] == val[1] } }.uniq  
  end

  def new_schedule
    @new_schedule = Schedule.new
    @lessons = Lesson.all
    @teachers = Teacher.all
    @week = ["Понедельник", "Вторник", "Среда", "Четверг", "Пятница"]
  end

  def add_schedule
    schedule = Schedule.new
    schedule_init = schedule.init_with_teach_les(schedule_params)
    respond_to do |format|
      unless schedule_init.nil?
        format.html { redirect_to admin_schedule_path }
        format.json { render json: schedule_init }
      else
        format.html { redirect_to admin_schedule_path }
        format.json { render json: [schedule_init, schedule_params] }
      end
    end
  end

  def update_class
    @week = ["Понедельник", "Вторник", "Среда", "Четверг", "Пятница"]
    @schedule_class = Schedule.where(class_id: params[:class_id])
    @lessons = Lesson.all
    @teachers = Teacher.all
  end

  def destroy_all_schedules 
  
  end

  # методы, работающие со школьными предметами
  def subject
    @error = params[:err]
    @lessons = Lesson.all.order(:name)
    @new_lesson = Lesson.new
    respond_to do |format|
      format.html
      format.json { render json: @lessons } 
    end
  end

  def add_subject
    subj = Lesson.new(subject_params)
    respond_to do |format|
      if subj.save
        format.html { redirect_to admin_subject_path }
        format.json { render json: subj }
      else
        format.html { redirect_to admin_subject_path }
        format.json { render json: [subj, subject_params] }
      end  
    end
  end

  def destroy_subject
    destroy_res = DestroySubject.call(params[:id])
    respond_to do |format|
      if destroy_res
        format.html { redirect_to admin_subject_path }
        format.json { render json: "Данные успешно удалены"}
      else
        format.html { redirect_to admin_subject_path(err: destroy_res) }
        format.json { render json: "Невозможно удалить данные" }
      end
    end
  end

  # методы, работающие с преподавателями
  def teacher
    @teachers = Teacher.all
    @new_teacher = Teacher.new
    @new_teacher.lessons.build
    @lessons = Lesson.all
    respond_to do |format|
      format.js
      format.html
    end
  end

  def add_teacher
    th = Teacher.new
    teacher = th.lesson_init(teacher_params)
    respond_to do |format|
      unless teacher.nil?
        format.html { redirect_to admin_teacher_path }
        format.json { render json: teacher }
      else
        format.html { redirect_to admin_teacher_path }
        format.json { render json: teacher_params }
      end
    end
  end

  def destroy_teacher
    destroy_res = DestroyTeacher.call(params[:id])
    respond_to do |format|
      if destroy_res
        format.html { redirect_to admin_teacher_path }
        format.json { render json: "Данные успешно удалены"}
      else
        format.html { redirect_to admin_teacher_path(err: destroy_res) }
        format.json { render json: "Невозможно удалить преподавателя"}
      end
    end
  end

  def update_teacher
    @teacher = Teacher.find_by(id: params[:id])
    @lessons = Lesson.all

  end

  private 

  def subject_params
    params.require(:lesson).permit(:name)
  end

  def teacher_params 
    params.require(:teacher).permit(:FIO, lessons_attributes: [:id])
  end

  def schedule_params
    params.require(:schedule).permit!
  end

  def update_admin_params
    params.require(:admin).permit(:id, :login, :password, :password_confirmation)
  end
end
