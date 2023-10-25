class User < ApplicationRecord
  has_paper_trail
  has_secure_password
  has_many :posts, class_name: 'Post', foreign_key: :user_id, dependent: :destroy

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
end
