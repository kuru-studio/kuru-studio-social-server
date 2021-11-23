module Types
  class LikeType < Types::BaseObject
    field :id, ID, null: false
    field :user, Types::UserType, null: false
    field :post, Types::PostType, null: false
  end
end
