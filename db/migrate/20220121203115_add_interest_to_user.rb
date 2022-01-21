class AddInterestToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :interests, :string, array: true, default: []
  end
end
