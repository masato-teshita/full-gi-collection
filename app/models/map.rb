class Map < ApplicationRecord
  belongs_to :shop
  geocoded_by :address
  after_validation :geocode
end
