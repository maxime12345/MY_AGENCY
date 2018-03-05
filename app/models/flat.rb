class Flat < ApplicationRecord
  belongs_to :user
  has_many :availabilities, dependent: :destroy
  has_many :candidacies, dependent: :destroy
  validates :name, :address, :price, :publication_date, :surface, :nb_rooms, :ad_url, :visit_capacity, presence: true
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  serialize :photo
end
