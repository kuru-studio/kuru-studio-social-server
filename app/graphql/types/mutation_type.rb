module Types
  class MutationType < BaseObject
    field :create_group, mutation: Mutations::CreateGroup
  end
end
