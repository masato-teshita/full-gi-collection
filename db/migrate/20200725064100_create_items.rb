class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.references :shop, foreign_key: true, null: false
      t.string :name, null: :false
      t.integer :item_status_id, null: :false
      t.text :explanation
      t.integer :price, null: false
      t.timestamps
    end
  end
end
