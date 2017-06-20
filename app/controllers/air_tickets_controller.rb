class AirTicketsController < BaseEventController
  
  belongs_to :participant, optional: true
  before_action :set_event
  
  def create
    create! { event_participant_path(@event, @participant) }
  end
  
  def destroy
    destroy! do |format|
      format.html { redirect_to :back }
    end
  end
  
  def update
    update! { event_participant_path(@event, @participant) }
  end
  
  private

    def air_ticket_params
      params.require(:air_ticket).permit(:participant_id, :arrive_at, :arrive_to, :leave_at, :leave_from, :estimated_at)
    end
    
    def set_event
      @event = Event.find(params[:event_id])
    end
end

