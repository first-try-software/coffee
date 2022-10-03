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

    it "adds sweetener to coffee when requested" do
      allow(driver).to receive(:dispense_cup)
      allow(driver).to receive(:heat_water)
      allow(driver).to receive(:prepare_grounds)
      allow(driver).to receive(:dispense_water)
      allow(driver).to receive(:dispense_sweetener)
      allow(driver).to receive(:dispose_of_grounds)

      machine.vend(drink: :coffee, options: { sweet: true })

      expect(driver).to have_received(:dispense_cup).ordered
      expect(driver).to have_received(:heat_water).ordered
      expect(driver).to have_received(:prepare_grounds).ordered
      expect(driver).to have_received(:dispense_water).ordered
      expect(driver).to have_received(:dispense_sweetener).ordered
      expect(driver).to have_received(:dispose_of_grounds).ordered
    end

    it "adds sweetener to tea when requested" do
      allow(driver).to receive(:dispense_cup)
      allow(driver).to receive(:heat_water)
      allow(driver).to receive(:dispense_tea_bag)
      allow(driver).to receive(:dispense_water)
      allow(driver).to receive(:dispense_sweetener)

      machine.vend(drink: :tea, options: { sweet: true })

      expect(driver).to have_received(:dispense_cup).ordered
      expect(driver).to have_received(:heat_water).ordered
      expect(driver).to have_received(:dispense_tea_bag).ordered
      expect(driver).to have_received(:dispense_water).ordered
      expect(driver).to have_received(:dispense_sweetener).ordered
    end

    it "adds cream to coffee when requested" do
      allow(driver).to receive(:dispense_cup)
      allow(driver).to receive(:heat_water)
      allow(driver).to receive(:prepare_grounds)
      allow(driver).to receive(:dispense_water)
      allow(driver).to receive(:dispense_cream)
      allow(driver).to receive(:dispose_of_grounds)

      machine.vend(drink: :coffee, options: { creamy: true })

      expect(driver).to have_received(:dispense_cup).ordered
      expect(driver).to have_received(:heat_water).ordered
      expect(driver).to have_received(:prepare_grounds).ordered
      expect(driver).to have_received(:dispense_water).ordered
      expect(driver).to have_received(:dispense_cream).ordered
      expect(driver).to have_received(:dispose_of_grounds).ordered
    end

    it "adds cream to tea when requested" do
      allow(driver).to receive(:dispense_cup)
      allow(driver).to receive(:heat_water)
      allow(driver).to receive(:dispense_tea_bag)
      allow(driver).to receive(:dispense_water)
      allow(driver).to receive(:dispense_cream)

      machine.vend(drink: :tea, options: { creamy: true })

      expect(driver).to have_received(:dispense_cup).ordered
      expect(driver).to have_received(:heat_water).ordered
      expect(driver).to have_received(:dispense_tea_bag).ordered
      expect(driver).to have_received(:dispense_water).ordered
      expect(driver).to have_received(:dispense_cream).ordered
    end

    it "serves cocoa when cocoa is requested" do
      allow(driver).to receive(:dispense_cup)
      allow(driver).to receive(:heat_water)
      allow(driver).to receive(:dispense_cocoa_mix)
      allow(driver).to receive(:dispense_water)

      machine.vend(drink: :cocoa)

      expect(driver).to have_received(:dispense_cup).ordered
      expect(driver).to have_received(:heat_water).ordered
      expect(driver).to have_received(:dispense_cocoa_mix).ordered
      expect(driver).to have_received(:dispense_water).ordered
    end

    it "does NOT add sweetener or cream when cocoa is requested" do
      allow(driver).to receive(:dispense_cup)
      allow(driver).to receive(:heat_water)
      allow(driver).to receive(:dispense_cocoa_mix)
      allow(driver).to receive(:dispense_water)
      allow(driver).to receive(:dispense_sweetener)
      allow(driver).to receive(:dispense_cream)

      machine.vend(drink: :cocoa, options: { sweet: true, creamy: true })

      expect(driver).to have_received(:dispense_cup).ordered
      expect(driver).to have_received(:heat_water).ordered
      expect(driver).to have_received(:dispense_cocoa_mix).ordered
      expect(driver).to have_received(:dispense_water).ordered
      expect(driver).not_to have_received(:dispense_sweetener)
      expect(driver).not_to have_received(:dispense_cream)
    end

    it "adds whipped cream to coffee when requested" do
      allow(driver).to receive(:dispense_cup)
      allow(driver).to receive(:heat_water)
      allow(driver).to receive(:prepare_grounds)
      allow(driver).to receive(:dispense_water)
      allow(driver).to receive(:dispense_whipped_cream)
      allow(driver).to receive(:dispose_of_grounds)

      machine.vend(drink: :coffee, options: { fluffy: true })

      expect(driver).to have_received(:dispense_cup).ordered
      expect(driver).to have_received(:heat_water).ordered
      expect(driver).to have_received(:prepare_grounds).ordered
      expect(driver).to have_received(:dispense_water).ordered
      expect(driver).to have_received(:dispense_whipped_cream).ordered
      expect(driver).to have_received(:dispose_of_grounds).ordered
    end

    it "adds whipped cream to cocoa when requested" do
      allow(driver).to receive(:dispense_cup)
      allow(driver).to receive(:heat_water)
      allow(driver).to receive(:dispense_cocoa_mix)
      allow(driver).to receive(:dispense_water)
      allow(driver).to receive(:dispense_whipped_cream)

      machine.vend(drink: :cocoa, options: { fluffy: true })

      expect(driver).to have_received(:dispense_cup).ordered
      expect(driver).to have_received(:heat_water).ordered
      expect(driver).to have_received(:dispense_cocoa_mix).ordered
      expect(driver).to have_received(:dispense_water).ordered
      expect(driver).to have_received(:dispense_whipped_cream).ordered
    end

    it "does NOT add whipped cream when tea is requested" do
      allow(driver).to receive(:dispense_cup)
      allow(driver).to receive(:heat_water)
      allow(driver).to receive(:dispense_tea_bag)
      allow(driver).to receive(:dispense_water)
      allow(driver).to receive(:dispense_whipped_cream)

      machine.vend(drink: :tea, options: { fluffy: true })

      expect(driver).to have_received(:dispense_cup).ordered
      expect(driver).to have_received(:heat_water).ordered
      expect(driver).to have_received(:dispense_tea_bag).ordered
      expect(driver).to have_received(:dispense_water).ordered
      expect(driver).not_to have_received(:dispense_whipped_cream)
    end
  end
end
