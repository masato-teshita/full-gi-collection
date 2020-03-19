class RenamePointColumnToWoms < ActiveRecord::Migration[5.0]
  def change
    rename_column :woms, :point, :rate
  end
end
