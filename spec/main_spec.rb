require_relative "../main.rb"

RSpec.describe Main do
  it "does something" do
    expect(described_class.run).to eq("SKU,Description,Source\n")
  end
end
