require_relative "beverage"

class AppleCider < Beverage
  def prepare
    dispense_cup
    heat_water
    dispense_cider_mix
    dispense_water
    dispense_cinnamon
  end

  private

  def dispense_cider_mix
    driver.dispense_cider_mix
  end

  def dispense_cinnamon
    driver.dispense_cinnamon
  end
end
