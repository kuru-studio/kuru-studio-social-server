module Types
  class QueryType < Types::BaseObject
    # queries are just represented as fields
    # `all_groups` is automatically camelcased to `allGroups`
    field :all_groups, [GroupType], null: false

    # this method is invoked, when `all_group` fields is being resolved
    def all_groups
      Group.all
    end
  end
end
