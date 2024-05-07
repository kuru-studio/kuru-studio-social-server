class Order < ApplicationRecord
  include ActsAsTenant

  belongs_to :user, class_name: 'User', foreign_key: :user_id, optional: false
end
