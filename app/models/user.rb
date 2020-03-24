class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :shop_users
  has_many :shops, through: :shop_users
  has_many :woms
  has_many :histories

  mount_uploader :image, ImageUploader
end
