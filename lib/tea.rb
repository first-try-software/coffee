require_relative "beverage"

class Tea < Beverage
  def prepare
    dispense_cup
    heat_water
    dispense_tea_bag
    dispense_water
    dispense_sweetener if options[:sweet]
    dispense_cream if options[:creamy]
  end

  private

  def dispense_tea_bag
    driver.dispense_tea_bag
  end

  def dispense_sweetener
    driver.dispense_sweetener
  end

  def dispense_cream
    driver.dispense_cream
  end
end
