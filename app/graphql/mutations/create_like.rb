module Mutations
  class CreateLike < BaseMutation
    argument :post_id, ID, required: false

    type Types::LikeType

    def resolve(post_id: nil)
      Like.create!(
        post: Post.find(post_id),
        user: context[:current_user]
      )
    end
  end
end
