class ChangeColumnUsers < ActiveRecord::Migration[5.0]
  def change
    change_column_default :users, :introduction, from: '', to: 'よろしくお願いいたします！'
  end
end
