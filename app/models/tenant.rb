class Tenant < ApplicationRecord
  validates :api_key, uniqueness: true

  has_many :users, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :carts, dependent: :destroy
  has_many :inventories, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :products, dependent: :destroy

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
