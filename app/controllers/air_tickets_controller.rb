class AirTicketsController < BaseEventController
  
  belongs_to :participant, optional: true
  before_action :set_event
  
  def create
    create! do |format|
      format.html {
        add_stays
        redirect_to event_participant_path(@event, @participant)
      }
    end
  end
  
  def destroy
    destroy! do |format|
      format.html {
        @air_ticket.participant.stays.delete_all
        redirect_to :back
      }
    end
  end
  
  def update
    update! do |format|
      format.html {
        @air_ticket.participant.stays.delete_all
        add_stays
        redirect_to event_participant_path(@event, @participant)
      }
    end
  end
  
  private

    def air_ticket_params
      params.require(:air_ticket).permit(:participant_id, :arrive_at, :arrive_to, :leave_at, :leave_from, :estimated_at)
    end
    
    def set_event
      @event = Event.find(params[:event_id])
    end
    
    def add_stays
      Stay.create(participant: @participant, place: Place.first, start_at: @air_ticket.estimated_at.beginning_of_day, end_at: @participant.modality.start_at.beginning_of_day, amount: 0) if @air_ticket.arrive_at < @participant.modality.start_at
      Stay.create(participant: @participant, place: Place.first, start_at: @participant.modality.end_at.beginning_of_day, end_at: @air_ticket.leave_at.beginning_of_day, amount: 0) if @participant.modality.end_at < @air_ticket.leave_at
    end
end
