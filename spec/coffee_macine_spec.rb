require_relative "../lib/coffee_machine"

RSpec.describe CoffeeMachine do
  subject(:machine) { described_class.new(driver: driver) }

  let(:driver) { Driver.new }

  describe "#vend" do
    it "serves coffee by default" do
      allow(driver).to receive(:dispense_cup)
      allow(driver).to receive(:heat_water)
      allow(driver).to receive(:prepare_grounds)
      allow(driver).to receive(:dispense_water)
      allow(driver).to receive(:dispose_of_grounds)

      machine.vend

      expect(driver).to have_received(:dispense_cup).ordered
      expect(driver).to have_received(:heat_water).ordered
      expect(driver).to have_received(:prepare_grounds).ordered
      expect(driver).to have_received(:dispense_water).ordered
      expect(driver).to have_received(:dispose_of_grounds).ordered
    end

    it "serves coffee when coffee is requested" do
      allow(driver).to receive(:dispense_cup)
      allow(driver).to receive(:heat_water)
      allow(driver).to receive(:prepare_grounds)
      allow(driver).to receive(:dispense_water)
      allow(driver).to receive(:dispose_of_grounds)

      machine.vend(drink: :coffee)

      expect(driver).to have_received(:dispense_cup).ordered
      expect(driver).to have_received(:heat_water).ordered
      expect(driver).to have_received(:prepare_grounds).ordered
      expect(driver).to have_received(:dispense_water).ordered
      expect(driver).to have_received(:dispose_of_grounds).ordered
    end

    it "serves tea when tea is requested" do
      allow(driver).to receive(:dispense_cup)
      allow(driver).to receive(:heat_water)
      allow(driver).to receive(:dispense_tea_bag)
      allow(driver).to receive(:dispense_water)

      machine.vend(drink: :tea)

      expect(driver).to have_received(:dispense_cup).ordered
      expect(driver).to have_received(:heat_water).ordered
      expect(driver).to have_received(:dispense_tea_bag).ordered
      expect(driver).to have_received(:dispense_water).ordered
    end
  end
end