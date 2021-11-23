module Types
  class LikeType < Types::BaseObject
    field :id, ID, null: false
    field :user, Types::UserType, null: false
    field :post, Types::LinkType, null: false
  end
end
