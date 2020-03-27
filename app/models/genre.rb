class Genre < ApplicationRecord
  has_many :shop_genres
  has_many :shops, through: :shop_genres

  def self.order_by_shops
    Genre.select('genres.*', 'count(shop_genres.id) AS shop_genres')
      .left_joins(:shop_genres)
      .group('genres.id')
      .order('shop_genres DESC')
  end
end
