# Примесь для обработки сессий администратора
module SessionsHelper
  # вход администратора
  def log_in(admin)
    session[:admin_id] = admin.id
  end

  # Возвращает текущего вошедшего администратора
  def current_admin
    @current_admin ||= Admin.find_by(id: session[:admin_id])
  end

  # проверка входа в систему
  def logged_in?
    !current_admin.nil?
  end

  # выход из системы
  def log_out
    session.delete(:admin_id)
    @current_admin = nil
  end

  # Проверка входа в систему, если не выполнена авторизация, отправляет администратора на страницу входа в систему
  def check_login
    if current_admin.nil?
      redirect_to admin_path message: "Войдите в систему"
    end
  end
end
