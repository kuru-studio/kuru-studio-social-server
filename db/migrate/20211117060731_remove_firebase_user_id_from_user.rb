class RemoveFirebaseUserIdFromUser < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :firebase_user_id, :string
  end
end
