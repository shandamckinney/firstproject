class Ability
  include CanCan::Ability

  def initialize(user)
    if user.nil?
     user = User.new
     can :read, :all
   elsif user.admin?
     can :manage, :all
   else
     can :read, Product
     can :manage, User
     can :manage, Comment
     cannot [:destroy, :delete], Comment
     cannot [:destroy, :delete], Product
   end
 end
end
