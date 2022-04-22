require_relative "../../../lib/source/catalog_item.rb"

RSpec.describe Source::CatalogItem do
  describe ".from_raw_data" do
    let(:raw_data) do
      [
        ["SKU", "Description"],
        ["sku1", "description1"],
        ["sku2", "description2"],
      ]
    end

    it "builds the expected array of barcode objects" do
      catalog = described_class.from_raw_data(raw_data)
      expect(catalog[0].sku).to eq("sku1")
      expect(catalog[0].description).to eq("description1")
      expect(catalog[1].sku).to eq("sku2")
      expect(catalog[1].description).to eq("description2")
    end
  end

  context "when input is invalid" do
    let(:raw_data) { [["whoops"]] }

    it "raises an error" do
      expect { described_class.from_raw_data(raw_data) }.to raise_error("Invalid catalog data")
    end
  end
end
