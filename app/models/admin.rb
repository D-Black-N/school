# модель администратора
class Admin < ApplicationRecord
  # валидация полей при работе с данными модели
  validates :login,  presence: true, length: { maximum: 20 }
  validates :password, presence: true, length: { minimum: 6 }

  # создание хешированного пароля для обеспечения безопасности
  has_secure_password
end
