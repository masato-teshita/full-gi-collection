class AddPostalCodeToShops < ActiveRecord::Migration[5.0]
  def change
    add_column :shops, :postal_code, :string
  end
end
