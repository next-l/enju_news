class Ability
  include CanCan::Ability

  def initialize(user, ip_addess = nil)
    case user.try(:role).try(:name)
    when 'Administrator'
      can :manage, NewsFeed
      can :manage, NewsPost
    when 'Librarian'
      can :read, NewsFeed
      can :read, NewsPost
    when 'User'
      can :read, NewsPost do |news_post|
        !news_post.draft?
      end
    else
      can :read, NewsPost do |news_post|
        !news_post.draft?
      end
    end
  end
end
