module Queries
  module Comment
    class All < Queries::BaseQuery
      description 'Return all the comments of a specific commentable.'
      argument :limit, Integer, required: false
      argument :offset, Integer, required: false
      argument :commentable_type, String, required: false
      argument :commentable_id, ID, required: false
      type [Types::CommentType], null: false

      def resolve(limit: 20, offset: 0, commentable_type:, commentable_id:)
        check_tenant!
        check_authentication!

        comment = context[:current_tenant].comments.where(
          commentable_type: commentable_type,
          commentable_id: commentable_id
        ).order('created_at DESC')
        comment.offset(offset).limit(limit)
      end
    end
  end
end
