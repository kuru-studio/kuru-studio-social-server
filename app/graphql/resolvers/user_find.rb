class Resolvers::UserFind < GraphQL::Schema::Resolver
  type [Types::UserType], null: false

  argument :id, ID, required: true

  def resolve(context)
    User.find(context[:id])
  end
end
