class ChangeColumnToShop < ActiveRecord::Migration[5.0]
  def up
    change_column :shops, :image, :string, unique: true
  end

  def down
    change_column :shops, :image, :string
  end
end
