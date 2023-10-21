# frozen_string_literal: true

module Types
  class PostType < Types::BaseObject
    field :id, ID, null: true
    field :content, String, null: true
  end
end
