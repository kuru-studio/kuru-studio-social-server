module Types
  class InvitationType < Types::BaseObject
    field :id, ID, null: false
    field :user_id, Int, null: false
    field :friend_id, Int, null: false
    field :confirmed, Boolean, null: false
  end
end
