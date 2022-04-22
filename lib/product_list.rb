class ProductList
  def self.build(source_catalog:, source_barcodes:)
    new([])
  end

  attr_reader :products

  def initialize(products)
    @products = products
  end

  def merge(product_list)
    self.class.new(products + product_list.products)
  end

  def to_csv
    ""
  end
end
