class Product
  def self.load_products_from_source(source_catalog:, source_barcodes:, source_name:)
    source_barcodes_by_sku = source_barcodes.group_by(&:sku)

    source_catalog.map do |source_catalog_item|
      sku = source_catalog_item.sku
      description = source_catalog_item.description
      barcodes = source_barcodes_by_sku[sku].map(&:barcode)

      new(sku:, description:, barcodes:, source_name:)
    end
  end

  attr_reader :sku, :description, :barcodes, :source_name

  def initialize(sku:, description:, barcodes:, source_name:)
    @sku = sku
    @description = description
    @barcodes = barcodes
    @source_name = source_name
  end
end
