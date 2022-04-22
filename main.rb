require_relative "./lib/source/catalog_item.rb"
require_relative "./lib/source/barcode.rb"
require_relative "./lib/merged_catalog.rb"
require_relative "./lib/product.rb"

class Main
  def self.run
    source_catalog_a = Source::CatalogItem.from_raw_data("a")
    source_barcodes_a = Source::Barcode.from_raw_data("a")
    source_catalog_b = Source::CatalogItem.from_raw_data("b")
    source_barcodes_b = Source::Barcode.from_raw_data("b")

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

    MergedCatalog.build_csv(products_a + products_b)
  end
end
