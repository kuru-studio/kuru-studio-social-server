class Inventory < ApplicationRecord
  include ActsAsTenant
  enum inventory_type: [:material, :product]
end
