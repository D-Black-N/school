# базовый контроллер приложения
class ApplicationController < ActionController::Base
  include SessionsHelper # добавление примеси работы с сессией для контроллеров

end
