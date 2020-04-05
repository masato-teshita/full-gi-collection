class ChangeColumnAddIndex < ActiveRecord::Migration[5.0]
  def change
    add_index :users, :name, unique: true
  end
end
