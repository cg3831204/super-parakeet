require_relative "../../lib/product.rb"
require_relative "../../lib/source/barcode.rb"
require_relative "../../lib/source/catalog_item.rb"

RSpec.describe Product do
  describe ".load_products_from_source" do
    let(:source_catalog) do
      [
        Source::CatalogItem.new(sku: "sku1", description: "description1"),
        Source::CatalogItem.new(sku: "sku2", description: "description2"),
      ]
    end

    let(:source_barcodes) do
      [
        Source::Barcode.new(sku: "sku1", barcode: "barcode1a"),
        Source::Barcode.new(sku: "sku1", barcode: "barcode1b"),
        Source::Barcode.new(sku: "sku2", barcode: "barcode2"),
      ]
    end

    let(:source_name) { "A" }

    it "loads the expected list of products" do
      products = described_class.load_products_from_source(source_catalog:, source_barcodes:, source_name:)
      expect(products[0].sku).to eq("sku1")
      expect(products[0].description).to eq("description1")
      expect(products[0].barcodes).to eq(["barcode1a", "barcode1b"])
      expect(products[0].source_name).to eq("A")
      expect(products[1].sku).to eq("sku2")
      expect(products[1].description).to eq("description2")
      expect(products[1].barcodes).to eq(["barcode2"])
      expect(products[1].source_name).to eq("A")
    end
  end
end
