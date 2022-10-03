require_relative "beverage"

class Cocoa < Beverage
  def prepare
    dispense_cup
    heat_water
    dispense_cocoa_mix
    dispense_water
    dispense_whipped_cream if options[:fluffy]
  end

  private

  def dispense_cocoa_mix
    driver.dispense_cocoa_mix
  end

  def dispense_whipped_cream
    driver.dispense_whipped_cream
  end
end
