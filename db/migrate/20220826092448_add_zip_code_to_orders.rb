class AddZipCodeToOrders < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :zip_code, :string
  end
end
