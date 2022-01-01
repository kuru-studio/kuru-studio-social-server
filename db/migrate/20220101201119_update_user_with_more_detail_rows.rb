class UpdateUserWithMoreDetailRows < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :name, :username
    add_column :users, :birthday, :date
    add_column :users, :country, :string
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :short_description, :string
    add_column :users, :about, :text
  end
end
