class Item < ApplicationRecord
  belongs_to :shop
  has_many_attached :images
end
