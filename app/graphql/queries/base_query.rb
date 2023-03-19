module Queries
  # Base Queries class
  class BaseQuery < GraphQL::Schema::Resolver
    private

    def check_authentication!
      return if context[:current_user]

      raise GraphQL::ExecutionError, 'You need to authenticate to perform this action'
    end
  end
end
