require_relative "../main.rb"

RSpec.describe Main do
  before do
    allow(Source::CatalogItem).to receive(:from_raw_data)
    allow(Source::Barcode).to receive(:from_raw_data)
    allow(Product).to receive(:load_products_from_source).and_return([])
  end

  it "does something" do
    expect(described_class.run).to eq("SKU,Description,Source\n")
  end
end
