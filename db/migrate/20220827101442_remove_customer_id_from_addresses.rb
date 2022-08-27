class RemoveCustomerIdFromAddresses < ActiveRecord::Migration[6.1]
  def change
    remove_column :addresses, :customer_id, :integer
  end
end
