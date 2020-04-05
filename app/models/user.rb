class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :shop_users
  has_many :shops, through: :shop_users
  has_many :woms
  has_many :histories
  has_many :clips

  validates :name, presence: true
  validates :name, uniqueness: true

  mount_uploader :image, ImageUploader
  mount_uploader :cover_image, ImageUploader
end
