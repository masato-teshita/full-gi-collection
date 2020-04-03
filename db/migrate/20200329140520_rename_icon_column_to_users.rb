class RenameIconColumnToUsers < ActiveRecord::Migration[5.0]
  def change
    rename_column :users, :icon, :cover_image
  end
end
