class Post < ApplicationRecord
  include ActsAsTenant
  include Commentable

  belongs_to :user, class_name: 'User', foreign_key: :user_id, optional: true
end
