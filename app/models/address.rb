class Address < ApplicationRecord

  belongs_to :customer

  VALID_ZIP_CODE_REGEX = /\A\d{7}\z/
  validates :zip_code, presence: true, format: { with: VALID_ZIP_CODE_REGEX }
  validates :address, presence: true
  validates :name, presence: true

  def address_display
  '〒' + postal_code + ' ' + address + ' ' + name
  end

end