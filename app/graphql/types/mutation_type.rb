module Types
  class MutationType < BaseObject
    field :create_user, mutation: Mutations::CreateUser
    field :create_group, mutation: Mutations::CreateGroup
    field :create_post, mutation: Mutations::CreatePost
    field :create_like, mutation: Mutations::CreateLike
    field :signin_user, mutation: Mutations::SignInUser
  end
end
