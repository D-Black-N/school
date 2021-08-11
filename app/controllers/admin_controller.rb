class AdminController < ApplicationController
  # before_action :set_array, only: [:add_teacher]

  def add
    @schedule = Schedule.new
    @week_day = ['Вс', "Пн", "Вт", "Ср", "Чт", "Пт", "Сб"]
  end

  def delete
  end

  def update
  end

  def subject
    @lessons = Lesson.all
    @new_lesson = Lesson.new
    respond_to do |format|
      format.html
      format.json { render json: @schedule } 
    end
  end

  def teacher
    @teachers = Teacher.all
    @new_teacher = Teacher.new
    @lessons = Lesson.all #.map { |subj| [subj.name, subj.id] }
    respond_to do |format|
      format.js
      format.html
    end
  end

  def add_teacher
    p "----------------------------------------------------------------------------"
    p "See that: #{teacher_params}"
    teacher = Teacher.new(teacher_params)
      if teacher.save
        redirect_to admin_teacher_path
        # render json: "teacher was successfully added"
      else
        render json: [teacher, teacher_params]
      end
    # end
  end

  def add_subject
    subj = Lesson.new(subject_params)
    respond_to do |format|
      if subj.save
        format.html { redirect_to admin_subject_path }
        format.json { render json: subj }
      else
        format.html { redirect_to admin_subject_path}
        format.json { render json: [subj, subject_params] }
      end  
    end
  end

  private 

  def subject_params
    params.require(:lesson).permit(:name)
  end

  def teacher_params 
    p params[:teacher][:lessons]
    params.require(:teacher).permit(:FIO, lesson_attributes: [:name])
  end
end
