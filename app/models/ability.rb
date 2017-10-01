class Ability
  include CanCan::Ability

  def initialize(current_user, options = {})
    current_user ||= User.new
    
    can :read, :all
    
    can :manage, :bookings do |booking|
      (booking.bed.room.house.location.name == 'Ashram' and current_user.hoster_ashram?) || (booking.bed.room.house.location.name == 'Morada' and current_user.hoster_morada?)
    end
    
  end
end
