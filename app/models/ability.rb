class Ability
  include CanCan::Ability

  def initialize( user )
      user ||= User.new # guest user (not logged in)
      if user.is? 'Admin'
        can :manage, :all
      elsif user.id
        #Messages
        can :manage, Message, :user_id => user.id
        can :read, Message
        #Users
        can :update, User, :id => user.id 
      else
        #Messages
        can :read, Message
        #Users
        can :read, User
      end
  end
end
