require_relative "beverage"

class TomatoSoup < Beverage
  def prepare
    dispense_cup
    heat_water
    dispense_condensed_soup
    dispense_water
    dispense_croutons if options[:crunchy]
    dispense_hot_sauce if options[:spicy]
  end

  private

  def dispense_condensed_soup
    driver.dispense_condensed_soup
  end

  def dispense_croutons
    driver.dispense_croutons
  end

  def dispense_hot_sauce
    driver.dispense_hot_sauce
  end
end
