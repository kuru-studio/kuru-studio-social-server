class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments, id: :uuid do |t|
      t.references :commentable, polymorphic: true, null: false, type: :uuid
      t.text :body
      t.uuid :user_id

      t.timestamps
    end
  end
end
