class Shop < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :area, optional: true
  has_many :woms
  has_many :shop_genres
  has_many :shop_brands
  has_many :shop_users
  has_many :genres, through: :shop_genres
  has_many :brands, through: :shop_brands
  has_many :users, through: :shop_users

  mount_uploader :image, ImageUploader

  def self.search(search)
    if search
      Shop.where('outline LIKE(?)', "%#{search}%")
    else
      Shop.all.order(:created_at, "DESC")
    end
  end
end
