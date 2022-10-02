require_relative "driver"

class CoffeeMachine
  attr_reader :driver

  def initialize(driver:)
    @driver = driver
  end

  def vend(drink: :coffee)
    if drink == :coffee
      dispense_cup
      heat_water
      prepare_grounds
      dispense_water
      dispose_of_grounds
    elsif drink == :tea
      dispense_cup
      heat_water
      dispense_tea_bag
      dispense_water
    end
  end

  private

  def dispense_cup
    driver.dispense_cup
  end

  def heat_water
    driver.heat_water
  end

  def prepare_grounds
    driver.prepare_grounds
  end

  def dispense_water
    driver.dispense_water
  end

  def dispose_of_grounds
    driver.dispose_of_grounds
  end

  def dispense_tea_bag
    driver.dispense_tea_bag
  end
end
