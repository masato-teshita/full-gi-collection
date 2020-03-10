class CreateWoms < ActiveRecord::Migration[5.0]
  def change
    create_table :woms do |t|
      t.text :content, null: false
      t.float :point, null: false
      t.string :visit_type, null: false
      t.references :user, foreign_key: true
      t.references :shop, foreign_key: true
      t.timestamps
    end
  end
end
