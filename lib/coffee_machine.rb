require_relative "driver"
require_relative "coffee"
require_relative "tea"
require_relative "cocoa"

class CoffeeMachine
  attr_reader :driver

  def initialize(driver:)
    @driver = driver
  end

  def vend(drink: :coffee, options: {})
    if drink == :coffee
      Coffee.new(driver, options).prepare
    elsif drink == :tea
      Tea.new(driver, options).prepare
    elsif drink == :cocoa
      Cocoa.new(driver, options).prepare
    end
  end
end
