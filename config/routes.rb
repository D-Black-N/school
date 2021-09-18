Rails.application.routes.draw do
  get 'admin/index'         #главное меню администратора
  get 'admin/passwd'        # редактирование профиля администратора
  post 'admin/update_admin' # обновление профиля администратора

  # предметы
  get 'admin/subject'
  post 'admin/add_subject'
  delete 'admin/destroy_subject' # удаление предмета из БД 

  # преподаватели
  get 'admin/teacher'
  post 'admin/add_teacher'
  get 'admin/update_teacher'     # редактирование преподавателя
  post 'admin/update_teacher'
  delete 'admin/destroy_teacher'  # удаление преподавателя из БД

  # расписание
  get 'admin/schedule'
  post 'admin/add_schedule'
  get 'admin/new_schedule'
  get 'admin/update_class'              # view редактрирование расписания класса
  post 'admin/update_schedule'
  delete 'admin/destroy_class_schedule' # удаление расписания одного класса
  delete 'admin/destroy_all_schedules'  # удаление всего расписания школы

  # страница с отображением расписания 
  root to: 'page#home'

  # контроллер сессий
  get 'admin', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  # get 'admin/add'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
