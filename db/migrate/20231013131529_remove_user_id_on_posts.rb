class RemoveUserIdOnPosts < ActiveRecord::Migration[7.0]
  def change
    remove_column :posts, :user_id
  end
end
