require_relative "../lib/coffee_machine"

RSpec.describe CoffeeMachine do
  subject(:machine) { described_class.new(driver: driver) }

  let(:driver) { Driver.new }

  describe "#vend" do
    it "serves hot water if an unknown beverage is requested" do
      beverage = instance_double("beverage")

      allow(BeverageFactory).to receive(:build).and_return(beverage)
      allow(beverage).to receive(:prepare)

      machine.vend(drink: :unknown)

      expect(BeverageFactory).to have_received(:build).with(:unknown, driver, {})
      expect(beverage).to have_received(:prepare)
    end

    it "serves plain coffee by default" do
      beverage = instance_double("beverage")

      allow(BeverageFactory).to receive(:build).and_return(beverage)
      allow(beverage).to receive(:prepare)

      machine.vend

      expect(BeverageFactory).to have_received(:build).with(:coffee, driver, {})
      expect(beverage).to have_received(:prepare)
    end

    it "serves the requested beverage with the provided options" do
      beverage = instance_double("beverage")

      allow(BeverageFactory).to receive(:build).and_return(beverage)
      allow(beverage).to receive(:prepare)

      machine.vend(drink: :cocoa, options: { fluffy: true })

      expect(BeverageFactory).to have_received(:build).with(:cocoa, driver, { fluffy: true })
      expect(beverage).to have_received(:prepare)
    end
  end
end
