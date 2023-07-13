class Ability
  include CanCan::Ability

  # def initialize(user)
  #   user ||= User.new # Guest user

  #   if user.admin?
  #     can :manage, :all
  #   elsif user.patient?
  #     can :read, Article
  #     # Additional permissions for patients
  #   elsif user.doctor?
  #     can :manage, Article
  #     # Additional permissions for doctors
  #   end
  # end
end

