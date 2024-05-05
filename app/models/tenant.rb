class Tenant < ApplicationRecord
  validates :api_key, uniqueness: true

  has_many :users
  has_many :posts
  has_many :comments
  has_many :carts
  has_many :inventories
  has_many :orders
  has_many :products

  %w(shop social forum).each do |feature|
    define_method("is_#{feature}_enabled?") do
      included_features.include?(feature)
    end

    define_method("toggle_#{feature}_status!") do
      if send("is_#{feature}_enabled?")
        included_features.delete(feature)
      else
        included_features << feature
      end
      save
    end
  end
end
