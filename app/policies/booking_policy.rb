class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    user_owner?
  end

  def new?
    record.dog.user != user
  end

  def create?
    new?
  end

  def destroy?
    user_owner?
  end

  def user_owner?
    record.user == user || record.dog.user
  end
end


