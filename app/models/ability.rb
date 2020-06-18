class Ability
  include CanCan::Ability

  def initialize(current_user, options = {})
    can :manage, :all if current_user.admin?
      
    if current_user.coord_country? or current_user.coord_outside?
      can :manage, Guest
      can :read, Event, :international => true
      can :manage, Participant
      can :read, Modality
      can :read, Space
      can :manage, Payment
      can :read, ChangeLog
    end

    if current_user.coord_eventer?
      can :manage, Guest
      can :manage, User
      can :manage, Event
      can :manage, Participant
      can :manage, Modality
      can :manage, Space
      can :manage, Stay
      can :manage, AirTicket
      can :manage, Payment
      can :read, Booking
      can :read, ChangeLog
    end
    
    if current_user.hoster?
      can :manage, Booking
      can :manage, :bookings do |booking|
        (booking.bed.room.house.location.name == 'Ashram' and current_user.hoster_ashram?) || (booking.bed.room.house.location.name == 'Morada' and current_user.hoster_morada?)
      end
      can :manage, ChangeLog
      can :manage, Guest
      can :read, Event
      can :read, Participant
      can :read, Modality
      can :read, Space
      can :read, Stay
      can :read, AirTicket
      can :read, Payment
    end
    
    if current_user.doctor?
      can :read, Guest
    end
    
    if current_user.viewer?
      can :read, Guest
    end
  end
end