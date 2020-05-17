class CreateShopImages < ActiveRecord::Migration[5.0]
  def change
    create_table :shop_images do |t|
      t.string :shop_image
      t.references :shop, foreign_key: true
      t.timestamps
    end
  end
end
