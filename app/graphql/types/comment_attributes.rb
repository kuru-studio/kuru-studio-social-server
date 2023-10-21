module Types
  class CommentAttributes < Types::BaseInputObject
    argument :commentable_type, String, required: true
    argument :commentable_id, ID, required: true
    argument :body, String, required: true
  end
end
