module Types
  class MutationType < Types::BaseObject
    field :create_post, mutation: Mutations::Post::Create
    field :create_user, mutation: Mutations::User::Create
    field :sign_in, mutation: Mutations::User::SignIn
  end
end
