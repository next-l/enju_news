class NewsPostPolicy < AdminPolicy
  def index?
    true
  end

  def create?
    user.try(:has_role?, 'Administrator')
  end

  def destroy?
    user.try(:has_role?, 'Administrator')
  end
end
