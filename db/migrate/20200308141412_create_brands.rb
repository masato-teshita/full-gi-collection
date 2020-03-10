class CreateBrands < ActiveRecord::Migration[5.0]
  def change
    create_table :brands do |t|
      t.string :name, null: false
      t.string :image, null: false
      t.timestamps
    end
  end
end
