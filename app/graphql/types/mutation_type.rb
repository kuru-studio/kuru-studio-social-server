module Types
  class MutationType < Types::BaseObject
    field :create_post, mutation: Mutations::Post::Create
    field :create_comment, mutation: Mutations::Comment::Create
    field :create_user, mutation: Mutations::User::Create
    field :sign_in, mutation: Mutations::User::SignIn
    field :update_user, mutation: Mutations::User::Update
  end
end
