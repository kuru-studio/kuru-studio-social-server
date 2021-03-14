class User < ApplicationRecord
  validates :firebase_user_id, presence: true, uniqueness: true
end
