require_relative "../../lib/merged_catalog.rb"
require_relative "../../lib/product.rb"

RSpec.describe MergedCatalog do
  describe ".build_csv" do
    let(:products) do
      [
        Product.new(sku: "1", description: "A1", barcodes: ["w", "x"], source_name: "A"),
        Product.new(sku: "2", description: "A2", barcodes: ["y"], source_name: "A"),
        Product.new(sku: "3", description: "A3", barcodes: ["z"], source_name: "A"),
        Product.new(sku: "3", description: "B1", barcodes: ["t"], source_name: "B"),
        Product.new(sku: "9", description: "B2", barcodes: ["v", "x"], source_name: "B"),
        Product.new(sku: "7", description: "B3", barcodes: ["z", "m"], source_name: "B"),
        Product.new(sku: "4", description: "C1", barcodes: ["m"], source_name: "C"),
        Product.new(sku: "0", description: "D1", barcodes: ["a"], source_name: "D"),
        Product.new(sku: "6", description: "D2", barcodes: ["b"], source_name: "D"),
      ]
    end

    let(:expected_csv) do
      <<~CSV
        SKU,Description,Source
        1,A1,A
        2,A2,A
        3,A3,A
        3,B1,B
        0,D1,D
        6,D2,D
      CSV
    end

    it "produces the expected csv" do
      expect(described_class.build_csv(products)).to eq(expected_csv)
    end
  end
end
