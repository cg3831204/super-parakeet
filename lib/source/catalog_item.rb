module Source
  class CatalogItem
    def self.from_raw_data(raw_data)
      raise "Invalid catalog data" if raw_data[0] != ["SKU", "Description"]

      raw_data[1..].map do |row|
        new(sku: row[0], description: row[1])
      end
    end

    attr_reader :sku, :description

    def initialize(sku:, description:)
      @sku = sku
      @description = description
    end
  end
end
