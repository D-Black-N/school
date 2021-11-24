# Базовый интерактор
class BaseInteractor
  class << self
    delegate :call, to: :new  # переназначения метода new на call 
  end
end