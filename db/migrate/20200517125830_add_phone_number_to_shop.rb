class AddPhoneNumberToShop < ActiveRecord::Migration[5.0]
  def change
    add_column :shops, :phone_number, :string
  end
end
