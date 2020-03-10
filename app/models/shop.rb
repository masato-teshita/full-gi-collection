class Shop < ApplicationRecord
  belongs_to :user
  belongs_to :area
  has_many :woms
  has_many :shop_genres
  has_many :shop_brands
  has_many :shop_users
  has_many :genres, through: :shop_genres
  has_many :brands, through: :shop_brands
  has_many :users, through: :shop_users

  def self.search(search)
    return Shop.all unless search
    Shop.where('text LIKE(?)', "%#{search}%")
  end
end
