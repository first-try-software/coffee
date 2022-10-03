require_relative "../lib/beverage_factory"
require_relative "../lib/driver"

RSpec.describe BeverageFactory do
  let(:driver) { Driver.new }

  describe ".build" do
    it "returns an instance of the requested beverage with the provided driver and options" do
      options = instance_double("options")

      expect(described_class.build(:coffee, driver, options))
        .to be_an_instance_of(Coffee)
        .and(have_attributes(driver: driver, options: options))

      expect(described_class.build(:tea, driver, options))
        .to be_an_instance_of(Tea)
        .and(have_attributes(driver: driver, options: options))

      expect(described_class.build(:cocoa, driver, options))
        .to be_an_instance_of(Cocoa)
        .and(have_attributes(driver: driver, options: options))

      expect(described_class.build(:tomato_soup, driver, options))
        .to be_an_instance_of(TomatoSoup)
        .and(have_attributes(driver: driver, options: options))
    end

    it "returns a null object when the requested beverage is not supported" do
      options = instance_double("options")

      expect(described_class.build(:hamburger, driver, options))
        .to be_an_instance_of(NullBeverage)
    end
  end
end
