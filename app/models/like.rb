class Like < ApplicationRecord
  belongs_to :post, validate: true
  belongs_to :user, validate: true

  validates :post, uniqueness: { scope: :user }
end
