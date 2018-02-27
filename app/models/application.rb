class Application < ApplicationRecord
  belongs_to :flat
  belongs_to :user
  has_many :bookings
end
