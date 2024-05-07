class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products, id: :uuid do |t|
      t.uuid :tenant_id, null: false

      t.timestamps
    end
  end
end
