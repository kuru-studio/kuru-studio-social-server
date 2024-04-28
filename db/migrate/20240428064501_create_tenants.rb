class CreateTenants < ActiveRecord::Migration[7.0]
  def change
    create_table :tenants, id: :uuid do |t|
      t.string :api_key
      t.text :allowed_domains, array: true, default: []

      t.timestamps
    end
  end
end
