require_relative "../lib/cocoa"

RSpec.describe Cocoa do
  let(:driver) { Driver.new }

  describe "#prepare" do
    it "does NOT add sweetener or cream when cocoa is requested" do
      allow(driver).to receive(:dispense_cup)
      allow(driver).to receive(:heat_water)
      allow(driver).to receive(:dispense_cocoa_mix)
      allow(driver).to receive(:dispense_water)
      allow(driver).to receive(:dispense_sweetener)
      allow(driver).to receive(:dispense_cream)

      described_class.new(driver, sweet: true, creamy: true).prepare

      expect(driver).to have_received(:dispense_cup).ordered
      expect(driver).to have_received(:heat_water).ordered
      expect(driver).to have_received(:dispense_cocoa_mix).ordered
      expect(driver).to have_received(:dispense_water).ordered
      expect(driver).not_to have_received(:dispense_sweetener)
      expect(driver).not_to have_received(:dispense_cream)
    end

    it "adds whipped cream to cocoa when requested" do
      allow(driver).to receive(:dispense_cup)
      allow(driver).to receive(:heat_water)
      allow(driver).to receive(:dispense_cocoa_mix)
      allow(driver).to receive(:dispense_water)
      allow(driver).to receive(:dispense_whipped_cream)

      described_class.new(driver, fluffy: true).prepare

      expect(driver).to have_received(:dispense_cup).ordered
      expect(driver).to have_received(:heat_water).ordered
      expect(driver).to have_received(:dispense_cocoa_mix).ordered
      expect(driver).to have_received(:dispense_water).ordered
      expect(driver).to have_received(:dispense_whipped_cream).ordered
    end
  end
end
