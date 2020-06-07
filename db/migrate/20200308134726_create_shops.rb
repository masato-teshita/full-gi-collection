class CreateShops < ActiveRecord::Migration[5.0]
  def change
    create_table :shops do |t|
      t.string :name,       null: false
      t.text :outline
      t.references :area, foreign_key: true
      t.string :address
      t.float :latitude
      t.float :longitude
      t.string :phone_number
      t.string :postal_code
      t.timestamps
    end
  end
end
