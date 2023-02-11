module Queries
  module Post
    class All < Queries::BaseQuery
      description 'Return all the posts.'
      argument :limit, Integer, required: false
      argument :offset, Integer, required: false
      type [Types::PostType], null: false

      def resolve(limit: 20, offset: 0)
        check_authentication!

        posts = ::Post.order('created_at DESC')
        posts.offset(offset).limit(limit)
      end
    end
  end
end
