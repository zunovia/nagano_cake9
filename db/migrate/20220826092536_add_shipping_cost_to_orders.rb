class AddShippingCostToOrders < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :shipping_cost, :integer
  end
end
