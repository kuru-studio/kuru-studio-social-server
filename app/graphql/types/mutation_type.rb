module Types
  class MutationType < BaseObject
    field :create_user, mutation: Mutations::CreateUser
    field :create_group, mutation: Mutations::CreateGroup
  end
end
