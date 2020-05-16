class RemoveMapsTabel < ActiveRecord::Migration[5.0]
  def change
    drop_table :maps
  end
end
