class Tenant < ApplicationRecord
  has_many :users
  has_many :posts
  has_many :comments
end
