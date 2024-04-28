class AddTenantIdToModels < ActiveRecord::Migration[7.0]
  def change
    add_column :comments, :tenant_id, :uuid, null: false
    add_column :posts, :tenant_id, :uuid, null: false
    add_column :users, :tenant_id, :uuid, null: false
  end
end
