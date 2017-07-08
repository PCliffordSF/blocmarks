class LikePolicy < ApplicationPolicy
    
  def update?
    false
  end

  def edit?
    false
  end

end