class Store < ApplicationRecord
  has_many :ratings

  validates :lonlat, presence: true
  validates :name, presence: true
  validates :google_place_id, presence: true, uniqueness: true

  def self.within(longitude, latitude, distance_in_km = 5)
    where(%{
      ST_Distance(lonlat, 'POINT(%f %f)') < %d
    } % [longitude, latitude, distance_in_km * 1000])
  end

  def ratings_average
    return 0 if ratings.empty?

    (ratings.sum(:value) / ratings.count).to_i
  end
end
