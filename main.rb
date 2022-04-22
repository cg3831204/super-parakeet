require_relative "./lib/source/catalog_item.rb"
require_relative "./lib/source/barcode.rb"
require_relative "./lib/product_list.rb"

class Main
  def self.run
    catalog_a = Source::CatalogItem.from_csv("a")
    barcodes_a = Source::Barcode.from_csv("a")
    catalog_b = Source::CatalogItem.from_csv("b")
    barcodes_b = Source::Barcode.from_csv("b")

    product_list_a = ProductList.build(
      source_catalog: catalog_a,
      source_barcodes: barcodes_a,
    )

    product_list_b = ProductList.build(
      source_catalog: catalog_b,
      source_barcodes: barcodes_b,
    )

    merged_product_list = product_list_a.merge(product_list_b)
    result = merged_product_list.to_csv
  end
end
