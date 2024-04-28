class User < ApplicationRecord
  include ActsAsTenant
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable,
         :confirmable,
         :lockable

  has_paper_trail
  has_many :posts, class_name: 'Post', foreign_key: :user_id, dependent: :destroy

  validates :name, presence: true
end
