class CreateGenres < ActiveRecord::Migration[5.0]
  def change
    create_table :genres do |t|
      t.string :name, null: false
      t.string :image
      t.timestamps
    end
  end
end
