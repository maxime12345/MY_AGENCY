class Booking < ApplicationRecord
  belongs_to :availability
  belongs_to :candidacy

  validate :check_flat_id
  validate :check_user

  private

  def check_flat_id
    if availability.flat_id != candidacy.flat_id
      errors.add(:base, "Incohérence entre l'appartement de la disponibilité et celle de la candidature.")
    end
  end

  def check_user
    Booking.where(candidacy_id: self.id)
  end

end
