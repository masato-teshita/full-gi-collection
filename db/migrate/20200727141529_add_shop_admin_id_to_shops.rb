class AddShopAdminIdToShops < ActiveRecord::Migration[5.2]
  def change
    add_column :shops, :shop_admin_id, :integer
  end
end
