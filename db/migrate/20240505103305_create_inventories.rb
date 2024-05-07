class CreateInventories < ActiveRecord::Migration[7.0]
  def change
    create_table :inventories, id: :uuid do |t|
      t.uuid :tenant_id, null: false

      t.timestamps
    end
  end
end
