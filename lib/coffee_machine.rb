require_relative "driver"
require_relative "beverage_factory"

class CoffeeMachine
  attr_reader :driver

  def initialize(driver:)
    @driver = driver
  end

  def vend(drink: :coffee, options: {})
    BeverageFactory.build(drink, driver, options).prepare
  end
end
