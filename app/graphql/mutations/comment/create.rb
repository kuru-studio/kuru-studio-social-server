module Mutations
  module Comment
    class Create < ::Mutations::BaseMutation
      argument :comment_attributes, Types::CommentAttributes, required: true

      field :comment, Types::CommentType, null: true
      field :errors, [String], null: true

      def resolve(comment_attributes:)
        check_tenant!
        check_authentication!
        comment = ::Comment.new(
          body: comment_attributes[:body],
          commentable_type: comment_attributes[:commentable_type],
          commentable_id: comment_attributes[:commentable_id],
          user_id: context[:current_user].id
        )

        if comment.save
          {
            comment: comment,
            errors: []
          }
        else
          {
            comment: nil,
            errors: comment.errors.full_messages
          }
        end
      end
    end
  end
end
