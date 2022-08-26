class Order < ApplicationRecord
 belongs_to :customer
  has_many :order_details, dependent: :destroy

  validates :payment_method, presence: true
  VALID_POSTAL_CODE_REGEX = /\A\d{7}\z/
  validates :postal_code, presence: true, format: { with: VALID_POSTAL_CODE_REGEX }
  validates :address, presence: true
  validates :name, presence: true

  def address_display
  '〒' + postal_code + ' ' + address
  end

  enum payment_method: { credit_card: 0, transfer: 1 }

  enum status: { payment_waiting: 0, payment_confirmation: 1, in_production: 2, preparing_delivery: 3, delivered: 4}

end

