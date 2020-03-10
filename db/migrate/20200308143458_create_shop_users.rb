class CreateShopUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :shop_users do |t|
      t.references :shop, foreign_key: true
      t.references :user, foreign_key: true
    end
  end
end
