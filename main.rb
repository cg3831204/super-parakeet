require "csv"
require_relative "./lib/source/catalog_item.rb"
require_relative "./lib/source/barcode.rb"
require_relative "./lib/merged_catalog.rb"
require_relative "./lib/product.rb"

class Main
  def self.run(input_path: "./input/")
    puts "Reading data from source..."
    source_catalog_a = Source::CatalogItem.from_raw_data(CSV.read("#{input_path}catalogA.csv"))
    source_barcodes_a = Source::Barcode.from_raw_data(CSV.read("#{input_path}barcodesA.csv"))
    source_catalog_b = Source::CatalogItem.from_raw_data(CSV.read("#{input_path}catalogB.csv"))
    source_barcodes_b = Source::Barcode.from_raw_data(CSV.read("#{input_path}barcodesB.csv"))

    puts "Loading products..."
    products_a = Product.load_products_from_source(
      source_catalog: source_catalog_a,
      source_barcodes: source_barcodes_a,
      source_name: "A",
    )

    products_b = Product.load_products_from_source(
      source_catalog: source_catalog_b,
      source_barcodes: source_barcodes_b,
      source_name: "B",
    )

    puts "Creating merged catalog..."
    merged_catalog_csv = MergedCatalog.build_csv(products_a + products_b)

    puts "Writing merged catalog..."
    File.write("./output/result_output.csv", merged_catalog_csv)

    puts "Done!"
  end
end
