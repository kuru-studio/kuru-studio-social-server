module Mutations
  module User
    class Update < ::Mutations::BaseMutation
      argument :update_user_attributes, Types::UpdateUserAttributes, required: true

      field :user, Types::UserType, null: true
      field :errors, [String], null: true

      def resolve(update_user_attributes:)
        check_tenant!
        check_authentication!
        user = context[:current_user]
        user.name = update_user_attributes[:name]
        if user.save
          {
            user: user,
            errors: []
          }
        else
          {
            user: nil,
            errors: user.errors.full_messages
          }
        end
      end
    end
  end
end
