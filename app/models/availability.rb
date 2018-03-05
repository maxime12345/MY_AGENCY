class Availability < ApplicationRecord
  belongs_to :flat
  has_many :bookings, dependent: :destroy
  validates :start_time, presence: true
end
