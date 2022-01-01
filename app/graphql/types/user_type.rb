module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false
    field :username, String, null: false
    field :email, String, null: false

    field :posts, [PostType], null: false
    field :likes, [LikeType], null: false
  end
end
