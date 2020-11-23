class Rating < ApplicationRecord
  belongs_to :store

  validates :value, presence: true
  validates :opinion, presence: true
  validates :user_name, presence: true
end
