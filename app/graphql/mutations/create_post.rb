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
    rescue ActiveRecord::RecordInvalid => e
      GraphQL::ExecutionError.new("Invalid input: #{e.record.errors.full_messages.join(', ')}")
    end
  end
end
