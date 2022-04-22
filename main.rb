require_relative "./lib/source/catalog_item.rb"
require_relative "./lib/source/barcode.rb"
require_relative "./lib/merged_catalog.rb"
require_relative "./lib/product.rb"

class Main
  def self.run
    catalog_a = Source::CatalogItem.from_raw_data("a")
    barcodes_a = Source::Barcode.from_raw_data("a")
    catalog_b = Source::CatalogItem.from_raw_data("b")
    barcodes_b = Source::Barcode.from_raw_data("b")

    products_a = Product.load_products_from_source(
      source_catalog: catalog_a,
      source_barcodes: barcodes_a,
      source_name: "A",
    )

    products_b = Product.load_products_from_source(
      source_catalog: catalog_b,
      source_barcodes: barcodes_b,
      source_name: "B",
    )

    MergedCatalog.build_csv(products_a + products_b)
  end
end
