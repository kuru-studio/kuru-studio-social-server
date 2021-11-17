module Types
  class GroupType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :description, String, null: false
    # `created_by` is automatically camelcased as `createdBy`
    # field can be nil, because we added users relationship later
    # "method" option remaps field to an attribute of Link model
    field :posted_by, UserType, null: true, method: :user
  end
end
