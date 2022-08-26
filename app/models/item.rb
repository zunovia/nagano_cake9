class Item < ApplicationRecord
  belongs_to :genre
  has_one_attached :image
  has_many :cart_items , dependent: :destroy
  has_many :order_items , dependent: :destroy
  enum sale_status: { 販売中: 0, 販売停止中: 1 }


  def get_image(width, height)
  unless image.attached?
    file_path = Rails.root.join('app/assets/images/no_image.jpg')
    image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
  end
    image.variant(resize_to_limit: [width, height]).processed
  end

  def tax_include_price
    (price*1.1).round(0)
  end

  def with_tax_price
    (price * 1.1).floor
  end


end
