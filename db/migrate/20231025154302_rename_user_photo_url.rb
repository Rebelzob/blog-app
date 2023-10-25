class RenameUserPhotoUrl < ActiveRecord::Migration[7.1]
  def change
    rename_column :users, :photo_url, :photo
  end
end
