class RemoveColumnsFromShops < ActiveRecord::Migration[5.0]
  def up
    remove_column :shops, :image, :string
    remove_column :shops, :genre_id, :integer
  end

  def down
    add_column :shops, :image, :string
    add_column :shops, :genre_id, :integer
  end
end
