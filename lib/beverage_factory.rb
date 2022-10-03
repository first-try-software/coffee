require_relative "coffee"
require_relative "tea"
require_relative "cocoa"
require_relative "tomato_soup"
require_relative "apple_cider"
require_relative "null_beverage"

class BeverageFactory
  BEVERAGES = {
    coffee: Coffee,
    tea: Tea,
    cocoa: Cocoa,
    tomato_soup: TomatoSoup,
    apple_cider: AppleCider
  }

  def self.build(beverage, driver, options)
    BEVERAGES.fetch(beverage, NullBeverage).new(driver, options)
  end
end
