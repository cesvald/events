class ParticipantsController < BaseEventController
  
  before_action :set_event, only: [:new, :create, :index]
  
  has_scope :by_name
	has_scope :by_surname
	has_scope :by_email
	
  def index
    @participants = params[:q] ? Guest.joins(participants: [participation: :space]).where("spaces.event_id = :event_id && guests.name ILIKE :query OR guests.surname ILIKE :query OR guests.email ILIKE :query OR concat_ws(' ', guests.name, guests.surname) ILIKE :query", {event_id: @event.id, query: "%#{params[:q]}%"}).page(params[:page]) : apply_scopes(Participant).page(params[:page])
		respond_to do |format|
			format.html
			format.json  { render :json => @participants.map(&:attributes) }
		end
  end
  
  private

    def participant_params
      params.require(:participant).permit(:guest_id, :participation_id)
    end
    
    def set_event
      @event = Event.find(params[:event_id])
    end
end

