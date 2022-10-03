require_relative "coffee"
require_relative "tea"
require_relative "cocoa"
require_relative "null_beverage"

class BeverageFactory
  def self.build(beverage, driver, options)
    klass = beverage.capitalize

    if Module.const_defined?(klass)
      Module.const_get(klass).new(driver, options)
    else
      NullBeverage.new(driver, options)
    end
  end
end
