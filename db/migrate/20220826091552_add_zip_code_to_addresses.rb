class AddZipCodeToAddresses < ActiveRecord::Migration[6.1]
  def change
    add_column :addresses, :zip_code, :string
  end
end
