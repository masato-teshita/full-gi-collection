class Wom < ApplicationRecord
  belongs_to :user
  belongs_to :shop
  def self.search(search)
    if search
      Wom.where('visit_type LIKE(?)', "%#{search}%")
    else
      Wom.all.order(:created_at, "DESC")
    end
  end
end
