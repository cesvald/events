class EventsController < BaseEventController
  
  private
    def event_params
      params.require(:event).permit(:name, :start_at, :end_at, :active)
    end
end