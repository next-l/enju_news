module EnjuNews
  class Ability
    include CanCan::Ability
    
    def initialize(user, ip_address = nil)
      case user.try(:role).try(:name)
      when 'Administrator'
        can :manage, [NewsFeed, NewsPost]
      when 'Librarian'
        can :read, [NewsFeed, NewsPost]
      when 'User'
        can :read, [NewsPost]
      else
        can :read, [NewsPost]
      end
    end
  end
end
