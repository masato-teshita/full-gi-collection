class Shop < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :area, optional: true
  has_many :historis
  has_many :clips
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

  def show_user_woms(user)
    if user.present?
      user_woms = woms.where(user_id: user.id)
      user_woms_count = user_woms.count
    else
      return "0"
    end
  end

  def show_user_clips(user)
    if user.present?
      user_clips = clips.where(user_id: user.id)
      user_clips_count = user_clips.count
    else
      return "0"
    end
  end

  def show_genres
    shop_genres = []
    genres.each do |genre|
      shop_genres << genre.name
    end
    return shop_genres.join(' ')
  end
end
