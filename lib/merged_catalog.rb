require "csv"

class MergedCatalog
  def self.build_csv(products)
    result_array = []

    # keep track of which products are already in the merged catalog
    already_seen_barcodes = {}
    is_barcode_already_seen = ->(barcode) { already_seen_barcodes[barcode] }
    mark_barcode_as_already_seen = ->(barcode) { already_seen_barcodes[barcode] = true }

    CSV.generate do |csv|
      csv << ["SKU", "Description", "Source"]

      products.each do |product|
        skip = product.barcodes.any?(&is_barcode_already_seen)
        product.barcodes.each(&mark_barcode_as_already_seen)
        csv << [product.sku, product.description, product.source_name] unless skip
      end
    end
  end
end
