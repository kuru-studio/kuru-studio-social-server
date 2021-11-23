module Mutations
  class CreatePost < BaseMutation
    # arguments passed to the `resolve` method
    argument :body, String, required: true

    # return type from the mutation
    type Types::PostType

    def resolve(name: nil, description: nil)
      Post.create!(
        body: body
      )
    end
  end
end
