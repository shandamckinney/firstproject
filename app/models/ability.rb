class Ability
  include CanCan::Ability

  def initialize(user)
    if user.nil?
      user = User.new
    elsif user.admin?
      can :manage, :all
    else
      can :manage, User
      can :manage, Comment
      cannot [:destroy, :delete], Comment
      cannot [:destroy, :delete], Product 
    end


    end
  end
end
