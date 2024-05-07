class User < ApplicationRecord
  include ActsAsTenant
  has_paper_trail

  validates :firebase_user_id, presence: true, uniqueness: { scope: :tenant_id }

  has_many :posts, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_one :cart, dependent: :destroy
end
