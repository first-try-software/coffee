require_relative "coffee"
require_relative "tea"
require_relative "cocoa"
require_relative "null_beverage"

class BeverageFactory
  BEVERAGES = {
    coffee: Coffee,
    tea: Tea,
    cocoa: Cocoa
  }

  def self.build(beverage, driver, options)
    BEVERAGES.fetch(beverage, NullBeverage).new(driver, options)
  end
end
