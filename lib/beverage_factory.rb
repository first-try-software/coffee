require_relative "coffee"
require_relative "tea"
require_relative "cocoa"
require_relative "null_beverage"

class BeverageFactory
  def self.build(beverage, driver, options)
    if beverage == :coffee
      Coffee.new(driver, options)
    elsif beverage == :tea
      Tea.new(driver, options)
    elsif beverage == :cocoa
      Cocoa.new(driver, options)
    else
      NullBeverage.new(driver, options)
    end
  end
end
