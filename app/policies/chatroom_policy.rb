class ChatroomPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    record.receiver == user || record.sender == user
  end

  def create?
    true
  end
end
