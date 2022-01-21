module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false
    field :username, String, null: false
    field :email, String, null: false
    field :birthday, GraphQL::Types::ISO8601Date, null: false
    field :country, String, null: false
    field :first_name, String, null: false
    field :last_name, String, null: false
    field :short_description, String, null: false
    field :about, String, null: false
    field :display_photo_url, String, null: false
    field :cover_photo_url, String, null: false

    field :posts, [PostType], null: false
    field :likes, [LikeType], null: false
  end
end
