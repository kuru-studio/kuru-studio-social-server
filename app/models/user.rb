class User < ApplicationRecord
  has_secure_password

  validates :username, presence: true, uniqueness: true, format: { with: /\A[a-zA-Z0-9]+\Z/ }, length: {minimum: 3, maximum: 20}
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }

  before_save { first_name.capitalize! }
  before_save { last_name.capitalize! }

  has_many :likes
  has_many :posts
end
