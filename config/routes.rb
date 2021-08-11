Rails.application.routes.draw do
  get 'admin/subject'
  post 'admin/add_subject'
  get 'admin/teacher'
  post 'admin/add_teacher'
  get 'admin/delete'
  get 'admin/update'
  root to: 'page#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
