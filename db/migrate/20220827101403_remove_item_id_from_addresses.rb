class RemoveItemIdFromAddresses < ActiveRecord::Migration[6.1]
  def change
    remove_column :addresses, :item_id, :integer
  end
end
