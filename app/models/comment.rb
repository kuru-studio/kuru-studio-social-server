class Comment < ApplicationRecord
  belongs_to :commentable, polymorphic: true
  validates :tenant, presence: true
end
