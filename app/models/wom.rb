class Wom < ApplicationRecord
  belongs_to :user
  belongs_to :shop

  validates :visit_type, presence: true
  validates :rate, presence: true
  validates :title, presence: true
  validates :content, presence: true

  def self.search(visit_type, shop_id)
    if visit_type != ""
      Wom.where('(visit_type = ?) AND (shop_id = ?)', "#{visit_type}", "#{shop_id}")
    else
      Wom.where(shop_id: "#{shop_id}").where.not(rate: nil)
    end
  end
end
