module Source
  class Barcode
    def self.from_csv(csv)
      []
    end

    attr_reader :sku, :barcode

    def initialize(sku:, barcode:)
      @sku = sku
      @barcode = barcode
    end
  end
end
