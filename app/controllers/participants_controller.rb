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
		@participants = apply_scopes(@event.participants)
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
		puts "The total participants are: " + @participants.count.to_s
		@participants.each do |participant|
			tokenControl = TokenControl.where(guest: participant.guest).first
			tokenControl = TokenControl.create(guest: participant.guest, auth_token: generate_auth_token) if not tokenControl
			puts "Token for " + participant.guest.email
			if tokenControl.state == 'pending'
				puts 'Sending email'
				GuestMailer.suscription(participant.guest, tokenControl.auth_token).deliver!
				tokenControl.state = 'sent'
				tokenControl.save
				puts 'Email sent and record changed state to sent'
			end
		end
	end
	
	def update
		update! { event_participant_path(@event, @participant) }
	end
	
	private

		def participant_params
			params.require(:participant).permit(:guest_id, :space_id, participant_spaces_attributes: [:id, :participant_id, :space_id, :_destroy])
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

