class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :shop_users
  has_many :shops, through: :shop_users
  has_many :woms
  has_many :histories
  has_many :clips

  # バリデーション
  validates :name, presence: true
  validates :name, uniqueness: true
  before_save { self.email = email.downcase }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, {presence: true, format: { with: VALID_EMAIL_REGEX }}

  mount_uploader :image, ImageUploader
  mount_uploader :cover_image, ImageUploader
end
