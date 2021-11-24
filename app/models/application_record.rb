# базовый класс моделей
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
