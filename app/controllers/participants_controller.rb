class ParticipantsController < BaseEventController
	
	before_action :set_event
	before_action :send_modalities, only: [:edit, :new, :index]
	
	has_scope :by_modality
	has_scope :by_space
	has_scope :by_guest
	has_scope :by_confirmed
	
	def create
		create! { event_participants_path(@event) }
	end
	
	def index
		@participants = current_user.admin? ? @event.participants : (current_user.coord_outside? ? @event.participants.by_outside(true) : @event.participants.by_country(current_user.country))
		@participants = apply_scopes(@participants).page(params[:page])
	end
	
	def destroy
		destroy! do |format|
			format.html { redirect_to :back }
		end
	end
	
	def next_deposit_state
		@participant = Participant.find(params[:id])
		@participant.next_deposit_state
		@participant.save!
		redirect_to event_participant_path(@event, @participant)
	end
	
	def send_suscription_mail
		@participants = apply_scopes(@event.participants)
		@participants.each do |participant|
			puts "Token for " + participant.guest.email
			tokenControl = TokenControl.where(guest: participant.guest).first
			tokenControl = TokenControl.create(guest: participant.guest, auth_token: generate_auth_token) if not tokenControl
			if tokenControl.state == 'pending'
				puts 'Sending email'
				GuestMailer.suscription(participant.guest, tokenControl.auth_token).deliver!
				tokenControl.state = 'sent'
				tokenControl.save
				puts 'Email sent and record changed state to sent'
			end
		end
		redirect_to event_participants_path(@event)
	end
	
	def update
		update! { event_participant_path(@event, @participant) }
	end
	
	def show
		@participant = resource
		@bookings = Kaminari.paginate_array(@participant.bookings).page(params[:page])
		@changes = Kaminari.paginate_array(@participant.change_logs).page(params[:change_page])
	end
	
	private

		def participant_params
			params.require(:participant).permit(:guest_id, :space_id, :author_id, participant_spaces_attributes: [:id, :participant_id, :space_id, :note, :_destroy])
		end
		
		def set_event
			@event = Event.find(params[:event_id])
		end
		
		def send_modalities
			@modalities = @event.modalities.includes(:spaces)
			gon.jbuilder "app/views/modalities/index.json.jbuilder", as: "modalities"
		end
		
		def collection
			@event.participants
		end
		
		def generate_auth_token
			SecureRandom.uuid.gsub(/\-/,'')
		end
end

