class Availability < ApplicationRecord
  belongs_to :flat
  has_many :bookings
  validates :start_time, presence: true
end
