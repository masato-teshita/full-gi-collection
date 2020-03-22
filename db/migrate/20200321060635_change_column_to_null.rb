class ChangeColumnToNull < ActiveRecord::Migration[5.0]
  def change
    change_column_null :woms, :rate, true
    change_column_null :woms, :visit_type, true
    change_column_null :woms, :content, true
    change_column_null :woms, :title, true
    change_column_null :woms, :visit_date, true
  end
end
