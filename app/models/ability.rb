class Ability
  include CanCan::Ability

  def initialize(current_user, options = {})
    current_user ||= User.new
    
    can :read, :all
    
  end
end