class DogPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    return true
  end

  def show?
    create?
  end

  def new?
    create?
  end

  def update?
    user_owner?
    # - record: the restaurant passed to the `authorize` method in controller
    # - user:   the `current_user` signed in with Devise.
  end

  def destroy?
    user_owner?
  end

  def user_owner?
    record.user == user
  end
end
