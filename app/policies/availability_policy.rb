class AvailabilityPolicy < ApplicationPolicy
  def index?
    return true
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    user.flat_ids.include?(record.flat_id)
  end

  def destroy?
    user.flat_ids.include?(record.flat_id)
  end
end
