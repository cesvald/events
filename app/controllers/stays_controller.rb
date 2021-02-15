class StaysController < BaseEventController
  
  belongs_to :participant, optional: true
  before_action :set_event
  before_action :set_author, only: :destroy
  
  def create
    create! { event_participant_path(@event, @participant) }
  end
  
  def destroy
    destroy! do |format|
      format.html { redirect_back(fallback_location: root_path) }
    end
  end
  
  def update
    update! { event_participant_path(@event, @participant) }
  end
  
  private

    def stay_params
      params.require(:stay).permit(:participant_id, :place_id, :end_at, :start_at, :amount, :author_id)
    end
    
    def set_event
      @event = Event.find(params[:event_id])
    end
    
    def set_author
      resource.author_id = current_user.id
    end
end

