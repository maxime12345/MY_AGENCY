class Flat < ApplicationRecord
  belongs_to :user
  has_many :availabilities
  has_many :candidacies
  validates :name, :address, :price, :publication_date, :surface, :nb_rooms, :ad_url, :visit_capacity, presence: true

end
