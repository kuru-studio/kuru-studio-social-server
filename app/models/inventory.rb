class Inventory < ApplicationRecord
  include ActsAsTenant
  enum inventory_type: {
    material: "material",
    product: "product",
  }
end
