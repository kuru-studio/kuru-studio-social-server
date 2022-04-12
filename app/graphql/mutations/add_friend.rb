module Mutations
  class AddFriend < BaseMutation
    # arguments passed to the `resolve` method
    argument :user_id, ID, required: true
    argument :friend_id, ID, required: true

    # return type from the mutation
    type Types::InvitationType

    def resolve(user_id: nil, friend_id: nil)
      user = User.find(user_id)
      friend = User.find(friend_id)
      user.send_invitation(friend)
    rescue ActiveRecord::RecordInvalid => e
      GraphQL::ExecutionError.new("Invalid input: #{e.record.errors.full_messages.join(', ')}")
    end
  end
end
