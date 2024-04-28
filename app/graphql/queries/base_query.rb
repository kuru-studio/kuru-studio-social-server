module Queries
  # Base Queries class
  class BaseQuery < GraphQL::Schema::Resolver
    private

    def check_authentication!
      return if context[:current_user]

      raise GraphQL::ExecutionError, 'You need to authenticate to perform this action'
    end

    def check_tenant!
      return if context[:current_tenant]

      raise GraphQL::ExecutionError, 'You need to have a tenant to perform this action'
    end
  end
end
