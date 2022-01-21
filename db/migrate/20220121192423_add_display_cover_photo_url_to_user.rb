class AddDisplayCoverPhotoUrlToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :display_photo_url, :string
    add_column :users, :cover_photo_url, :string
  end
end
