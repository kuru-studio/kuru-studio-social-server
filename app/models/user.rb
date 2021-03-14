class User < ApplicationRecord
  validates :firebase_user_id, presence: true, uniqueness: true

  def find_by_firebase_user_id(user_id)
    self.find_by(firebase_user_id: user_id)
  end
end
