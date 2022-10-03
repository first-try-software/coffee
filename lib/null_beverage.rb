require_relative "beverage"

class NullBeverage < Beverage
  def prepare
    # no-op
  end
end
