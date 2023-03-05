module Mutations
  module Post
    class Create < ::Mutations::BaseMutation
      argument :post_attributes, Types::PostAttributes, required: true

      field :post, Types::PostType, null: true
      field :errors, [String], null: true

      def resolve(post_attributes:)
        check_authentication!
        post = ::Post.new(
          content: post_attributes[:content],
          user_id: context[:current_user].id
        )

        if post.save
          {
            post: post,
            errors: []
          }
        else
          {
            post: nil,
            errors: post.errors.full_messages
          }
        end
      end
    end
  end
end
