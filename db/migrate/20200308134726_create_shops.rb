class CreateShops < ActiveRecord::Migration[5.0]
  def change
    create_table :shops do |t|
      t.string :name,       null: false
      t.string :image
      t.text :outline
      # t.references :area, foreign_key: true
      t.timestamps
    end
  end
end
