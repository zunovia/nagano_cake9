class CartItem < ApplicationRecord

  belongs_to :customer
  belongs_to :item

  with_options presence: true do
    validates :amount, numericality: { only_integer: true, greater_than: 0 }
    validates :customer_id
    validates :item_id
  end

  def all_with_tax_price
      item.price*1.1*amount
  end

  def subtotal
    item.with_tax_price * amount
  end

end
