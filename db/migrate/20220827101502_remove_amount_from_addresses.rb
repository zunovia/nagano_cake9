class RemoveAmountFromAddresses < ActiveRecord::Migration[6.1]
  def change
    remove_column :addresses, :amount, :integer
  end
end
