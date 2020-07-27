class Item < ApplicationRecord
  belongs_to :shop
  has_many_attached :images
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :item_status
end
