class PageController < ApplicationController
  def home
    @lessons = Schedule.find_by_sql("
      SELECT s.class_id, l.name as object, t.FIO as teacher, s.t_end 
      FROM schedules s, lessons l, teachers t
      WHERE s.lesson_id = l.id and s.teacher_id = t.id
    ")
    respond_to do |format|    
      format.js
      format.html   
    end
  end

  private

  
end
