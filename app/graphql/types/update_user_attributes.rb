module Types
  class UpdateUserAttributes < BaseInputObject
    argument :name, String, required: true
  end
end
