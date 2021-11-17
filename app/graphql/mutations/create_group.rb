module Mutations
  class CreateGroup < BaseMutation
    # arguments passed to the `resolve` method
    argument :name, String, required: true
    argument :description, String, required: true

    # return type from the mutation
    type Types::GroupType

    def resolve(name: nil, description: nil)
      Group.create!(
        name: name,
        description: description,
        user: context[:current_user]
      )
    end
  end
end
