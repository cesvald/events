class StaysController < BaseEventController
  
  belongs_to :participant, optional: true
  before_action :set_event
  
  def new
    new! do |format|
      format.html {
        gon.end_pre_date = @participant.modality.start_at
        gon.start_post_date = @participant.modality.end_at
      }
    end
  end
  
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

    def stay_params
      params.require(:stay).permit(:participant_id, :place_id, :end_at, :start_at, :amount)
    end
    
    def set_event
      @event = Event.find(params[:event_id])
    end
end

