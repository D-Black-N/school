# контроллер сессий администратора
class SessionsController < ApplicationController
  # страница входа в меню администратора
  def new
    @message = params[:message]
  end

  # создание новой сессии администратора
  def create
    admin = Admin.find_by_login(params[:session][:login]) # поиск данных по логину администратора
    # генерация данных для отправки клиенту
    respond_to do |format|
      if admin && admin.authenticate(params[:session][:password]) # проверка введенных данных для аутентификации
        log_in admin                                              # аутентификация
        format.html { redirect_to admin_index_path }              # перенаправление в главное меню
        format.json                                               # генерация данных в формате json
      else
        format.html { redirect_to admin_path message: "Ошибка аутентификации, неверный логин или пароль"} # генерация сообщения об ошибке введенных данных
        format.json { render json: params }                                                               # генерация введенных данных в формате json 
      end
    end
  end

  # удаление сессии пользователя
  def destroy
    log_out                 # выход с аккаунта
    redirect_to root_path   # перенаправление на общую страницу
  end
end
