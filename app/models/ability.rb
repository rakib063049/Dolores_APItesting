class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.admin?
      can :manage, :all
    else
      can :read, :all
    end

    can :create, Customer if user.role?(:create_customers)
    can :create, Contact if user.role?(:create_contacts)
    can :manage, Project if user.role?(:create_projects)
  end
end
