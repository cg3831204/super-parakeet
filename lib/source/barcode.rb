module Source
  class Barcode
    def self.from_raw_data(raw_data)
      raise "Invalid barcodes data" if raw_data[0] != ["SupplierID", "SKU", "Barcode"]

      raw_data[1..].map do |row|
        new(sku: row[1], barcode: row[2])
      end
    end

    attr_reader :sku, :barcode

    def initialize(sku:, barcode:)
      @sku = sku
      @barcode = barcode
    end
  end
end
