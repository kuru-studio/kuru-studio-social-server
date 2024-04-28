class User < ApplicationRecord
  include ActsAsTenant
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :confirmable,
         :lockable
  has_paper_trail

  validates :name, presence: true
  validates :email, presence: true, uniqueness: { scope: :tenant_id, case_sensitive: false }

  has_many :posts, class_name: 'Post', foreign_key: :user_id, dependent: :destroy
end
