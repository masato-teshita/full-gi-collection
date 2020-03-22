class Wom < ApplicationRecord
  belongs_to :user
  belongs_to :shop
  def self.search(visit_type, shop_id)
    if visit_type != ""
      Wom.where('(visit_type = ?) AND (shop_id = ?)', "#{visit_type}", "#{shop_id}")
    else
      Wom.where('shop_id = ?', "#{shop_id}")
    end
  end
end
