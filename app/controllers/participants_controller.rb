class ParticipantsController < BaseEventController
  
  before_action :set_event
  before_action :send_modalities, only: [:edit, :new]
  
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
  
  def create
    participation = Participation.where(modality_id: params[:modality_id], space_id: params[:space_id]).first
    participation = Participation.create(modality_id: params[:modality_id], space_id: params[:space_id]) if participation.nil?
    
    participant = Participant.new(participant_params)
    participant.participation = participation
    
    if participant.save
      flash[:notice] = "Participante creado exitosamente"
      return redirect_to event_participants_path(@event)
    else
      flash[:alert] = "No se pudo crear el participante"
      return render participant
    end
  end
  
  def update
    update! do |format|
      format.html {
        participation = Participation.where(modality_id: params[:modality_id], space_id: params[:space_id]).first
        participation = Participation.create(modality_id: params[:modality_id], space_id: params[:space_id]) if participation.nil?
        
        if @participant.participation != participation
          @participant.participation = participation
          @participant.save
        end
        
        redirect_to event_participants_path(@event)
      }
    end
  end
  
  def destroy
    destroy! do |format|
      format.html { redirect_to :back }
    end
  end
  
  private

    def participant_params
      params.require(:participant).permit(:guest_id, :participation_id)
    end
    
    def set_event
      @event = Event.find(params[:event_id])
    end
    
    def send_modalities
      @modalities = @event.modalities.includes(:spaces)
      gon.jbuilder "app/views/modalities/index.json.jbuilder", as: "modalities"
    end
end

