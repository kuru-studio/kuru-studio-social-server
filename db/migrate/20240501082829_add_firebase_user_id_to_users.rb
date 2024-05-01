class AddFirebaseUserIdToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :firebase_user_id, :string
  end
end
