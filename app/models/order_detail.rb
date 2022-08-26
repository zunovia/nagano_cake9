class OrderDetail < ApplicationRecord

  belongs_to :order
  belongs_to :item

  def with_tax_price
      (price * 1.1).floor
  end

  def subtotal
    self.with_tax_price * amount
  end

  enum making_status: { production_not_possible: 0, production_pending: 1, in_production: 2, production_complete: 3 }

end