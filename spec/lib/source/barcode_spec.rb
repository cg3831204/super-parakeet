require_relative "../../../lib/source/barcode.rb"

RSpec.describe Source::Barcode do
  describe ".from_raw_data" do
    let(:raw_data) do
      [
        ["SKU", "Barcode"],
        ["sku1", "barcode1"],
        ["sku2", "barcode2"],
      ]
    end

    it "builds the expected array of barcode objects" do
      barcodes = described_class.from_raw_data(raw_data)
      expect(barcodes[0].sku).to eq("sku1")
      expect(barcodes[0].barcode).to eq("barcode1")
      expect(barcodes[1].sku).to eq("sku2")
      expect(barcodes[1].barcode).to eq("barcode2")
    end

    context "when input is invalid" do
      let(:raw_data) { [["whoops"]] }

      it "raises an error" do
        expect { described_class.from_raw_data(raw_data) }.to raise_error("Invalid barcodes data")
      end
    end
  end
end
