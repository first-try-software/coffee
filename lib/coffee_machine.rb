require_relative "driver"

class CoffeeMachine
  attr_reader :driver

  def initialize(driver:)
    @driver = driver
  end

  def vend(drink: :coffee, options: {})
    if drink == :coffee
      dispense_cup
      heat_water
      prepare_grounds
      dispense_water
      dispense_sweetener if options[:sweet]
      dispense_cream if options[:creamy]
      dispense_whipped_cream if options[:fluffy]
      dispose_of_grounds
    elsif drink == :tea
      dispense_cup
      heat_water
      dispense_tea_bag
      dispense_water
      dispense_sweetener if options[:sweet]
      dispense_cream if options[:creamy]
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
