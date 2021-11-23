module Types
  class PostType < Types::BaseObject
    field :id, ID, null: false
    field :content, String, null: false
  end
end
