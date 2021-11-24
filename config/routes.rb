Rails.application.routes.draw do
  get 'admin/index'         #главное меню администратора
  get 'admin/passwd'        # редактирование профиля администратора
  post 'admin/update_admin' # обновление профиля администратора

  # предметы
  get 'admin/subject'             # страница предметов
  post 'admin/add_subject'        # добавление предмета в БД
  delete 'admin/destroy_subject'  # удаление предмета из БД 

  # преподаватели
  get 'admin/teacher'             # страница преподавателей
  post 'admin/add_teacher'        # добавление нового преподавателя в БД
  get 'admin/update_teacher'      # страница редактирования преподавателя
  post 'admin/update_teacher'     # обновление информации о преподавателе
  delete 'admin/destroy_teacher'  # удаление преподавателя из БД

  # расписание
  get 'admin/schedule'                  # страница информации о расписании
  post 'admin/add_schedule'             # добавление расписания в БД
  get 'admin/new_schedule'              # страница создания расписания класса
  get 'admin/update_class'              # представление редактрирование расписания класса
  post 'admin/update_schedule'          # обновление данных о расписании класса
  delete 'admin/destroy_class_schedule' # удаление расписания одного класса
  delete 'admin/destroy_all_schedules'  # удаление всего расписания школы

  # страница с отображением расписания доступная для всех пользователей
  root to: 'page#home'

  # контроллер сессий
  get 'admin', to: 'sessions#new'         # страница входа в систему
  post 'login', to: 'sessions#create'     # создание новой сессии
  delete 'logout', to: 'sessions#destroy' # выход из системы

  # get 'admin/add'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
