require_relative "../lib/tomato_soup"

RSpec.describe TomatoSoup do
  let(:driver) { Driver.new }

  describe "#prepare" do
    it "adds croutons to soup when requested" do
      allow(driver).to receive(:dispense_cup)
      allow(driver).to receive(:heat_water)
      allow(driver).to receive(:dispense_condensed_soup)
      allow(driver).to receive(:dispense_water)
      allow(driver).to receive(:dispense_croutons)

      described_class.new(driver, crunchy: true).prepare

      expect(driver).to have_received(:dispense_cup).ordered
      expect(driver).to have_received(:heat_water).ordered
      expect(driver).to have_received(:dispense_condensed_soup).ordered
      expect(driver).to have_received(:dispense_water).ordered
      expect(driver).to have_received(:dispense_croutons).ordered
    end

    it "adds hot sauce to soup when requested" do
      allow(driver).to receive(:dispense_cup)
      allow(driver).to receive(:heat_water)
      allow(driver).to receive(:dispense_condensed_soup)
      allow(driver).to receive(:dispense_water)
      allow(driver).to receive(:dispense_hot_sauce)

      described_class.new(driver, spicy: true).prepare

      expect(driver).to have_received(:dispense_cup).ordered
      expect(driver).to have_received(:heat_water).ordered
      expect(driver).to have_received(:dispense_condensed_soup).ordered
      expect(driver).to have_received(:dispense_water).ordered
      expect(driver).to have_received(:dispense_hot_sauce).ordered
    end
  end
end
