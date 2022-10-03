require_relative "driver"
require_relative "coffee"
require_relative "tea"

class CoffeeMachine
  attr_reader :driver

  def initialize(driver:)
    @driver = driver
  end

  def vend(drink: :coffee, options: {})
    if drink == :coffee
      Coffee.new(driver, options).prepare
    elsif drink == :tea
      Tea.new(driver, options).prepare
    elsif drink == :cocoa
      dispense_cup
      heat_water
      dispense_cocoa_mix
      dispense_water
      dispense_whipped_cream if options[:fluffy]
    end
  end

  private

  def dispense_cup
    driver.dispense_cup
  end

  def heat_water
    driver.heat_water
  end

  def dispense_water
    driver.dispense_water
  end

  def dispense_sweetener
    driver.dispense_sweetener
  end

  def dispense_cream
    driver.dispense_cream
  end

  def dispense_cocoa_mix
    driver.dispense_cocoa_mix
  end

  def dispense_whipped_cream
    driver.dispense_whipped_cream
  end
end
