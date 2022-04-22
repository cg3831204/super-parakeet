class Product
  def self.load_products_from_source(source_catalog:, source_barcodes:, source_name:)
    []
  end

  attr_reader :sku, :description, :barcodes, :source_name

  def initialize(sku:, description:, barcodes:, source_name:)
    @sku = sku
    @description = description
    @barcodes = barcodes
    @source_name = source_name
  end
end
