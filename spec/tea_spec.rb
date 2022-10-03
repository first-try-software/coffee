require_relative "../lib/tea"

RSpec.describe Tea do
  let(:driver) { Driver.new }

  describe "#prepare" do
    it "adds sweetener to tea when requested" do
      allow(driver).to receive(:dispense_cup)
      allow(driver).to receive(:heat_water)
      allow(driver).to receive(:dispense_tea_bag)
      allow(driver).to receive(:dispense_water)
      allow(driver).to receive(:dispense_sweetener)

      described_class.new(driver, sweet: true).prepare

      expect(driver).to have_received(:dispense_cup).ordered
      expect(driver).to have_received(:heat_water).ordered
      expect(driver).to have_received(:dispense_tea_bag).ordered
      expect(driver).to have_received(:dispense_water).ordered
      expect(driver).to have_received(:dispense_sweetener).ordered
    end

    it "adds cream to tea when requested" do
      allow(driver).to receive(:dispense_cup)
      allow(driver).to receive(:heat_water)
      allow(driver).to receive(:dispense_tea_bag)
      allow(driver).to receive(:dispense_water)
      allow(driver).to receive(:dispense_cream)

      described_class.new(driver, creamy: true).prepare

      expect(driver).to have_received(:dispense_cup).ordered
      expect(driver).to have_received(:heat_water).ordered
      expect(driver).to have_received(:dispense_tea_bag).ordered
      expect(driver).to have_received(:dispense_water).ordered
      expect(driver).to have_received(:dispense_cream).ordered
    end

    it "does NOT add whipped cream when tea is requested" do
      allow(driver).to receive(:dispense_cup)
      allow(driver).to receive(:heat_water)
      allow(driver).to receive(:dispense_tea_bag)
      allow(driver).to receive(:dispense_water)
      allow(driver).to receive(:dispense_whipped_cream)

      described_class.new(driver, fluffy: true).prepare

      expect(driver).to have_received(:dispense_cup).ordered
      expect(driver).to have_received(:heat_water).ordered
      expect(driver).to have_received(:dispense_tea_bag).ordered
      expect(driver).to have_received(:dispense_water).ordered
      expect(driver).not_to have_received(:dispense_whipped_cream)
    end
  end
end
