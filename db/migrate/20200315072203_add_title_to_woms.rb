class AddTitleToWoms < ActiveRecord::Migration[5.0]
  def change
    add_column :woms, :title, :string, null: false
    add_column :woms, :image, :string
    add_column :woms, :visit_date, :date, null: false
  end
end
