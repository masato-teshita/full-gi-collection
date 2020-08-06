class Item < ApplicationRecord
  belongs_to :shop
  has_many_attached :images
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :item_status

  def self.import(file, shop_id)
    CSV.foreach(file.path, headers: true) do |row|
      item = find_by(id: row["id"]) || new
      item.attributes = row.to_hash.slice(*updatable_attributes)
      item.shop_id = shop_id
      item.save
    end
  end

  def self.updatable_attributes
    [
      "id",
      "name",
      "item_status_id",
      "explanation",
      "price",
      "size",
      "size_detail",
    ]
  end
end
