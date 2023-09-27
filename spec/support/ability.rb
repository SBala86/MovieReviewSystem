class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the user here
    user ||= User.new # Guest user (not logged in)

    if user.persisted? # Check if the user is logged in
      can :create, Review # Allow creating reviews
      can :update, Review, user_id: user.id
    end
  end
end
