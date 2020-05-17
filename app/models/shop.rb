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
  geocoded_by :address
  after_validation :geocode

  validates :name, presence: true

  # S3へ連携したら下記を使用する
  # mount_uploader :image, ImageUploader

  scope :shop_includes, -> do
    includes(:area).includes(:genres).includes(:brands)
  end

  def self.search(area, search)
    shops = []
    splid_words = search.split(/[[:blank:]]+/)
    if splid_words.length == 0
      keyword_shops = Shop.shop_includes
                      .where('shops.name ilike ? OR shops.outline ilike ?', "%#{search}%", "%#{search}%")
                      .where('areas.name ilike ?', "%#{area}%").references(:area)
      brand_shops = Shop.shop_includes
                      .where('brands.name ilike ?', "%#{search}%").references(:brands)
                      .where('areas.name ilike ?', "%#{area}%").references(:area)
      genre_shops = Shop.shop_includes
                      .where('genres.name ilike ?', "%#{search}%").references(:genres)
                      .where('areas.name ilike ?', "%#{area}%").references(:area)
      shops.concat(keyword_shops).concat(brand_shops).concat(genre_shops)
    else
      splid_words.each do |search|
        next if search == ""
        keyword_shops = Shop.shop_includes
                        .where('shops.name ilike ? OR shops.outline ilike ?', "%#{search}%", "%#{search}%")
                        .where('areas.name ilike ?', "%#{area}%").references(:area)
        brand_shops = Shop.shop_includes
                        .where('brands.name ilike ?', "%#{search}%").references(:brands)
                        .where('areas.name ilike ?', "%#{area}%").references(:area)
        genre_shops = Shop.shop_includes
                        .where('genres.name ilike ?', "%#{search}%").references(:genres)
                        .where('areas.name ilike ?', "%#{area}%").references(:area)
        shops += shops.concat(keyword_shops).concat(brand_shops).concat(genre_shops)
      end
    end
    shops.uniq
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

  def get_genres
    shop_genres = []
    genres.each do |genre|
      shop_genres << genre.name
    end
  end
end
