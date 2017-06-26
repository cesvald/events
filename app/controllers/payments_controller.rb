class PaymentsController < BaseEventController
  
  belongs_to :participant, optional: true
  
  before_action :set_event
  
  def create
    create! { event_participant_path(@event, @participant) }
  end
  
  def update
    update! { event_participant_path(@event, @participant) }
  end
  
  def destroy
    destroy! { event_participant_path(@event, @participant) }
  end
  
  private
  
    def payment_params
      params.require(:payment).permit(:participant_id, :paid_at, :amount, :description, :method)
    end
    
    def set_event
      @event = Event.find(params[:event_id])
    end
end

