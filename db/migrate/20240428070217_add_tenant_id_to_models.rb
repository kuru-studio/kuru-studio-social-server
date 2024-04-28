class AddTenantIdToModels < ActiveRecord::Migration[7.0]
  def change
    add_reference :comments, :tenant, foreign_key: true, null: false
    add_reference :posts, :tenant, foreign_key: true, null: false
    add_reference :users, :tenant, foreign_key: true, null: false
  end
end
