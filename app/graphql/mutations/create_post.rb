module Mutations
  class CreatePost < BaseMutation
    # arguments passed to the `resolve` method
    argument :content, String, required: true

    # return type from the mutation
    type Types::PostType

    def resolve(name: nil, description: nil)
      Post.create!(
        content: content
      )
    end
  end
end
