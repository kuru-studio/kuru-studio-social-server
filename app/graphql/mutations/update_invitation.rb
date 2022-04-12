module Mutations
  class UpdateInvitation < BaseMutation
    # arguments passed to the `resolve` method
    argument :invitation_id, ID, required: true
    argument :answer, String, required: true

    # return type from the mutation
    type Types::InvitationType

    def resolve(invitation_id: nil, answer: nil)
      invitation = Invitation.find(invitation_id)
      case answer
      when "ACCEPT"
        invitation.confirmed = true
      when "REJECT"
        invitation.confirmed = false
      end
      invitation.save
      return invitation
    rescue ActiveRecord::RecordInvalid => e
      GraphQL::ExecutionError.new("Invalid input: #{e.record.errors.full_messages.join(', ')}")
    end
  end
end
