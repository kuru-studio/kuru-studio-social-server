class User < ApplicationRecord
  include ActsAsTenant
  has_paper_trail

  validates :firebase_user_id, presence: true, uniqueness: { scope: :tenant_id }

  has_many :posts, class_name: 'Post', foreign_key: :user_id, dependent: :destroy
end
