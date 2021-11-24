# контролле отображения основной страницы
class PageController < ApplicationController
  # получение необходимых данных для отображения
  def home
    @date = DateTime.now.strftime("%Y %m %d")                           # преобразование времени в строковый формат
    time = Time.now.change({ year: 2000, month: 1, day: 1, offset: 0})  # преобразование текущей даты для правильного отображения
    wday = ["Воскресенье", "Понедельник", "Вторник", "Среда", "Четверг", "Пятница", "Суббота"]
    @lessons = Schedule.where("week_day = ? and t_start <= ? and t_end >= ?", 
                              wday[time.wday - 1],
                              time + 5.minutes,
                              time - 3.minutes).order(:class_id)        # получение расписания из БД
    # формирование данных для отправки клиенту
    respond_to do |format|    
      format.js   # формат для правильной работы асинхронных запросов
      format.html
    end
  end
end
