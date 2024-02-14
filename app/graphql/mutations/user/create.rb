module Mutations
  module User
    class Create < ::Mutations::BaseMutation
      class CredentialsData < Types::BaseInputObject
        argument :credentials, Types::UserAttributes, required: false
      end

      argument :name, String, required: true
      argument :auth_provider, CredentialsData, required: false

      type Types::UserType

      def resolve(name: nil, auth_provider: nil)
        ::User.create!(
          name: name,
          email: auth_provider&.[](:credentials)&.[](:email),
          password: auth_provider&.[](:credentials)&.[](:password),
          password_confirmation: auth_provider&.[](:credentials)&.[](:password_confirmation),
          confirmed_at: Time.now
        )
      end
    end
  end
end
