module Mutations
  class BaseMutation < GraphQL::Schema::RelayClassicMutation
    argument_class Types::BaseArgument
    field_class Types::BaseField
    input_object_class Types::BaseInputObject
    object_class Types::BaseObject
    # Fix for duplicate CreateInput error that stops the schema from being loaded
    # Issue Link: https://github.com/rmosolgo/graphql-ruby/issues/3919
    def self.default_graphql_name
      _mutations_namespace, object_name, action_name = self.name.split("::")
      "#{action_name}#{object_name}"
    end

    def check_authentication!
      return if context[:current_user]

      raise GraphQL::ExecutionError, 'You need to authenticate to perform this action'
    end
  end
end
