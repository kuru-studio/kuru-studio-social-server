class Product < ApplicationRecord
  include ActsAsTenant
  monetize :price_cents
end
