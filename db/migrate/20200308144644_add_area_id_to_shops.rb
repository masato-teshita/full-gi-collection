class AddAreaIdToShops < ActiveRecord::Migration[5.0]
  def change
    add_reference :shops, :area, foreign_key: true
  end
end
