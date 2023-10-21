# frozen_string_literal: true

module Types
  class CommentType < Types::BaseObject
    field :id, ID, null: true
    field :body, String, null: true
    field :commentable_type, String, null: true
    field :commentable_id, ID, null: true
  end
end
