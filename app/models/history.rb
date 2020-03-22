class History < ApplicationRecord
  belongs_to :user
  has_one :shop
end
