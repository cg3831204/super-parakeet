require_relative "../main.rb"

RSpec.describe Main do
  let(:expected_output_csv) do
    <<~CSV
      SKU,Description,Source
      999-hello-world,My Product,A
      111-luffy,zoro,A
      647-vyk-317,Hello WORLD!,A
      280-oad-768,Bread - Raisin,A
      165-rcy-650,Hello WORLD!,A
      167-eol-949,Cheese - Grana Padano,A
      650-epd-782,Carbonated Water - Lemon Lime,A
      999-hello-world,My Product,B
      999-eol-949,Cheese - Grana Padano,B
      999-epd-782,Carbonated Water - Lemon Lime,B
    CSV
  end

  it "writes the expected output CSV for the provided input CSVs" do
    expect(FileUtils).to receive(:mkdir_p).with("./output/")
    expect(File).to receive(:write).with("./output/result_output.csv", expected_output_csv)
    described_class.run(input_path: "./spec/input/")
  end
end
