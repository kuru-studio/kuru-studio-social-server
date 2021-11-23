module Mutations
  class CreatePost < BaseMutation
    # arguments passed to the `resolve` method
    argument :content, String, required: true

    # return type from the mutation
    type Types::PostType

    def resolve(content: nil)
      Post.create!(
        content: content,
        user: context[:current_user]
      )
    end
  end
end
