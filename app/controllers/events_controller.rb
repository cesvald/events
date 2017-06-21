class EventsController < BaseEventController
  
  def create
    create! { events_path }
  end
  
  def update
    update! { events_path }
  end
  
  private
    def event_params
      params.require(:event).permit(:name, :start_at, :end_at, :active)
    end
end