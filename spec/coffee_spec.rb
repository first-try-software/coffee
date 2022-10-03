require_relative "../lib/coffee"

RSpec.describe Coffee do
  let(:driver) { Driver.new }

  describe "#prepare" do
    it "adds sweetener to coffee when requested" do
      allow(driver).to receive(:dispense_cup)
      allow(driver).to receive(:heat_water)
      allow(driver).to receive(:prepare_grounds)
      allow(driver).to receive(:dispense_water)
      allow(driver).to receive(:dispense_sweetener)
      allow(driver).to receive(:dispose_of_grounds)

      described_class.new(driver, sweet: true).prepare

      expect(driver).to have_received(:dispense_cup).ordered
      expect(driver).to have_received(:heat_water).ordered
      expect(driver).to have_received(:prepare_grounds).ordered
      expect(driver).to have_received(:dispense_water).ordered
      expect(driver).to have_received(:dispense_sweetener).ordered
      expect(driver).to have_received(:dispose_of_grounds).ordered
    end

    it "adds cream to coffee when requested" do
      allow(driver).to receive(:dispense_cup)
      allow(driver).to receive(:heat_water)
      allow(driver).to receive(:prepare_grounds)
      allow(driver).to receive(:dispense_water)
      allow(driver).to receive(:dispense_cream)
      allow(driver).to receive(:dispose_of_grounds)

      described_class.new(driver, creamy: true).prepare

      expect(driver).to have_received(:dispense_cup).ordered
      expect(driver).to have_received(:heat_water).ordered
      expect(driver).to have_received(:prepare_grounds).ordered
      expect(driver).to have_received(:dispense_water).ordered
      expect(driver).to have_received(:dispense_cream).ordered
      expect(driver).to have_received(:dispose_of_grounds).ordered
    end

    it "adds whipped cream to coffee when requested" do
      allow(driver).to receive(:dispense_cup)
      allow(driver).to receive(:heat_water)
      allow(driver).to receive(:prepare_grounds)
      allow(driver).to receive(:dispense_water)
      allow(driver).to receive(:dispense_whipped_cream)
      allow(driver).to receive(:dispose_of_grounds)

      described_class.new(driver, fluffy: true).prepare

      expect(driver).to have_received(:dispense_cup).ordered
      expect(driver).to have_received(:heat_water).ordered
      expect(driver).to have_received(:prepare_grounds).ordered
      expect(driver).to have_received(:dispense_water).ordered
      expect(driver).to have_received(:dispense_whipped_cream).ordered
      expect(driver).to have_received(:dispose_of_grounds).ordered
    end
  end
end
