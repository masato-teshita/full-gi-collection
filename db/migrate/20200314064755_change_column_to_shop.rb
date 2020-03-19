class ChangeColumnToShop < ActiveRecord::Migration[5.0]
  def change
    add_index :shops, :image, unique: true
  end
end
