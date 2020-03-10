class CreateShopBrands < ActiveRecord::Migration[5.0]
  def change
    create_table :shop_brands do |t|
      t.references :shop, foreign_key: true
      t.references :brand, foreign_key: true
    end
  end
end
