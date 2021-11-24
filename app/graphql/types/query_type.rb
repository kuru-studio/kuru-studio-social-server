module Types
  class QueryType < Types::BaseObject
    field :all_groups, [GroupType], null: false
    field :all_posts, [PostType], null: false

    field :search_posts, [PostType], resolver: Resolvers::PostsSearch

    def all_groups() Group.all end
    def all_posts() Post.all end
  end
end
