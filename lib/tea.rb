class Tea
  attr_reader :driver, :options

  def initialize(driver, options)
    @driver = driver
    @options = options
  end

  def prepare
    dispense_cup
    heat_water
    dispense_tea_bag
    dispense_water
    dispense_sweetener if options[:sweet]
    dispense_cream if options[:creamy]
  end

  private

  def dispense_cup
    driver.dispense_cup
  end

  def heat_water
    driver.heat_water
  end

  def dispense_tea_bag
    driver.dispense_tea_bag
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
end
