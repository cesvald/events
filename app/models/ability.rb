class Ability
  include CanCan::Ability

  def initialize(current_user, options = {})
    current_user ||= User.new
    
    if current_user.admin?
      can :manage, :all
    
    elsif current_user.coord_country? or current_user.coord_outside?
      can :manage, Guest
      can :view, Event do |event|
        event.international
      end
      can :manage, Participant
      can :view, Modality
      can :view, Space
      can :manage, Payment
    end
    
    can :manage, :bookings do |booking|
      (booking.bed.room.house.location.name == 'Ashram' and current_user.hoster_ashram?) || (booking.bed.room.house.location.name == 'Morada' and current_user.hoster_morada?)
    end
    
  end
end