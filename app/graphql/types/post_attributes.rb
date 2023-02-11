module Types
  class PostAttributes < Types::BaseInputObject
    argument :content, String, required: false
  end
end
