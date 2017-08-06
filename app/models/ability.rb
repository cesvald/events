class Ability
  include CanCan::Ability

  def initialize(current_user, options = {})
    current_user ||= User.new
    
    can :read, :all
    
    can :manage, :bookings do |booking|
      (booking.location == 'Ashram' and current_user.admin_ashram?) || (booking.location == 'Morada' and current_user.admin_morada?)
    end
    
  end
end
