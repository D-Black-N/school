class BaseInteractor
  class << self
    delegate :call, to: :new
  end
end