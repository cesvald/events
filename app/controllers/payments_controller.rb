class PaymentsController < ApplicationController
  
  inherit_resources
  
  belongs_to :participant, :booking, polymorphic: true, optional: true
  
  before_action :set_event
  
  def index
    @booking = parent
    index!
  end
  
  def create
    create! { session[:previous_url] }
  end
  
  def update
    update! { session[:previous_url] }
  end
  
  def destroy
    destroy! { url_for(request.referer) }
  end
  
  def new
    session[:previous_url] = request.referer
    @payable = parent
    new!
  end
  
  def edit
    session[:previous_url] = request.referer
    @payable = parent
    edit!
  end
  
  private
  
    def payment_params
      params.require(:payment).permit(:participant_id, :paid_at, :amount, :description, :method, :reason)
    end
    
    def set_event
      @event = Event.find(params[:event_id]) if params[:event_id]
    end
end

