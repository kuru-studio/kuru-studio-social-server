class User < ApplicationRecord
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
  validates :email, presence: true, uniqueness: true
end
