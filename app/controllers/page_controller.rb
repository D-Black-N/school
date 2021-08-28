class PageController < ApplicationController
  def home
    @date = DateTime.now.strftime("%Y %m %d")
    time = Time.now.change({ year: 2000, month: 1, day: 1, offset: 0})
    wday = ["Воскресенье", "Понедельник", "Вторник", "Среда", "Четверг", "Пятница", "Суббота"]
    @lessons = Schedule.where("week_day = ? and t_start <= ? and t_end >= ?", 
                              wday[time.wday - 1],
                              time + 5.minutes,
                              time - 3.minutes).order(:class_id)
    respond_to do |format|    
      format.js
      format.html
    end
  end
end
