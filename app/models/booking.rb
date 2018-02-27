class Booking < ApplicationRecord
  belongs_to :availability
  belongs_to :application
end
