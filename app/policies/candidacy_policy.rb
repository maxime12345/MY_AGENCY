class CandidacyPolicy < ApplicationPolicy
  def create?
    return true
  end
  def update?
    return true
    # - record: the restaurant passed to the `authorize` method in controller
    # - user:   the `current_user` signed in with Devise.
  end

  def index?
    record.user == user
  end

  def destroy?
    record.user == user
  end
  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
