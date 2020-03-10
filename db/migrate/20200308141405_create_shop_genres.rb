class CreateShopGenres < ActiveRecord::Migration[5.0]
  def change
    create_table :shop_genres do |t|
      t.references :shop, foreign_key: true
      t.references :genre, foreign_key: true
    end
  end
end
