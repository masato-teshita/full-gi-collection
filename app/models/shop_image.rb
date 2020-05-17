class ShopImage < ApplicationRecord
  mount_uploader :shop_image, ImageUploader
  belongs_to :shop
end
