require_relative "../lib/apple_cider"

RSpec.describe AppleCider do
  let(:driver) { Driver.new }

  describe "#prepare" do
    it "prepares cider when requested" do
      allow(driver).to receive(:dispense_cup)
      allow(driver).to receive(:heat_water)
      allow(driver).to receive(:dispense_cider_mix)
      allow(driver).to receive(:dispense_water)
      allow(driver).to receive(:dispense_cinnamon)

      described_class.new(driver, {}).prepare

      expect(driver).to have_received(:dispense_cup).ordered
      expect(driver).to have_received(:heat_water).ordered
      expect(driver).to have_received(:dispense_cider_mix).ordered
      expect(driver).to have_received(:dispense_water).ordered
      expect(driver).to have_received(:dispense_cinnamon).ordered
    end
  end
end
