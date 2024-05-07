class Tenant < ApplicationRecord
  validates :api_key, uniqueness: true

  has_many :users, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :carts, dependent: :destroy
  has_many :inventories, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :products, dependent: :destroy

  enum included_features: [
    :shop,
    :social,
    :forum,
    :block,
    :group,
    :list,
    :blog
  ]
end
