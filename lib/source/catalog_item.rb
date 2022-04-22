module Source
  class CatalogItem
    def self.from_csv(csv)
      []
    end

    attr_reader :sku, :description

    def initialize(sku:, description:)
      @sku = sku
      @description = description
    end
  end
end
