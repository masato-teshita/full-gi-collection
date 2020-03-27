class Brand < ApplicationRecord
  has_many :shop_brands
  has_many :shops, through: :shop_brands

  def self.order_by_shops
    Brand.select('brands.*', 'count(shop_brands.id) AS shop_brands')
      .left_joins(:shop_brands)
      .group('brands.id')
      .order('shop_brands DESC')
  end
end
