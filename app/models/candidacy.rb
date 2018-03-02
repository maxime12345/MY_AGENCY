class Candidacy < ApplicationRecord
  belongs_to :flat
  belongs_to :user
  has_many :bookings
  has_many :messages
  validates :user, uniqueness: { scope: :flat }
  # validate :user_is_not_owner

  # def user_is_not_owner
  #   if self.flat.user == self.user
  #       errors.add_to_base("Vous ne pouvez pas candidater pour votre appartement.")
  #   end
  # end
end
