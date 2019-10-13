class Ability
  include CanCan::Ability

  def initialize(current_user, options = {})
    
    
    if current_user.admin?
      can :manage, :all
    
    elsif current_user.coord_country? or current_user.coord_outside?
      can :manage, Guest
      can :read, Event, :international => true
      can :manage, Participant
      can :read, Modality
      can :read, Space
      can :manage, Payment
    end
    
    can :manage, :bookings do |booking|
      (booking.bed.room.house.location.name == 'Ashram' and current_user.hoster_ashram?) || (booking.bed.room.house.location.name == 'Morada' and current_user.hoster_morada?)
    end
    
    if current_user.doctor?
      can :read, Guest
    end
    
    if current_user.viewer?
      can :read, Guest
    end
  end
end