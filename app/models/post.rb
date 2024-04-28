class Post < ApplicationRecord
  include Commentable
  validates :tenant, presence: true

  belongs_to :user, class_name: 'User', foreign_key: :user_id, optional: true
end
