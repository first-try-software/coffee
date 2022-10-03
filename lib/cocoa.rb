class Cocoa
  attr_reader :driver, :options

  def initialize(driver, options)
    @driver = driver
    @options = options
  end

  def prepare
    dispense_cup
    heat_water
    dispense_cocoa_mix
    dispense_water
    dispense_whipped_cream if options[:fluffy]
  end

  private

  def dispense_cup
    driver.dispense_cup
  end

  def heat_water
    driver.heat_water
  end

  def dispense_cocoa_mix
    driver.dispense_cocoa_mix
  end

  def dispense_water
    driver.dispense_water
  end

  def dispense_whipped_cream
    driver.dispense_whipped_cream
  end
end
