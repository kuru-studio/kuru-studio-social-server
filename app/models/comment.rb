class Comment < ApplicationRecord
  include ActsAsTenant
  belongs_to :commentable, polymorphic: true
end
