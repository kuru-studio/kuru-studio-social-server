class User < ApplicationRecord
  has_secure_password

  validates :username, presence: true, uniqueness: true, format: { with: /\A[a-zA-Z0-9]+\Z/ }, length: {minimum: 3, maximum: 20}
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }

  has_many :likes
  has_many :posts
end
