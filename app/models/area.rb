class Area < ApplicationRecord
  has_many :shops

  def self.order_by_shops
    Area.select('areas.*', 'count(shops.id) AS shops')
      .left_joins(:shops)
      .group('areas.id')
      .order('shops DESC')
  end
end
