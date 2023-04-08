require_relative "beverage"

class Coffee < Beverage
  def prepare
    dispense_cup
    heat_water
    prepare_grounds
    dispense_water
    dispense_sweetener if sweet?
    dispense_cream if creamy?
    dispense_whipped_cream if fluffy?
    dispose_of_grounds
  end

  private

  def prepare_grounds
    driver.prepare_grounds
  end

  def dispose_of_grounds
    driver.dispose_of_grounds
  end

  def dispense_sweetener
    driver.dispense_sweetener
  end

  def dispense_cream
    driver.dispense_cream
  end

  def dispense_whipped_cream
    driver.dispense_whipped_cream
  end
end
