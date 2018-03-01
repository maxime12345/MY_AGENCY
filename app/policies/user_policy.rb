class UserPolicy < ApplicationPolicy
  def create?
    return true
  end
  def update?
    record == user
    # - record: the restaurant passed to the `authorize` method in controller
    # - user:   the `current_user` signed in with Devise.
  end
  class Scope < Scope
    def resolve
      scope
    end
  end
end
