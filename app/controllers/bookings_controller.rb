class BookingsController < BaseHostingController
	
	respond_to :html, :json
	
	before_action :add_locations
	before_action :check_profiles
	#before_action :check_location_profile_create, only: [:create]
	#before_action :check_location_profile_update, only: [:update, :destroy, :edit]
	
	def index
		@booking = Booking.new
		if not params.has_key?(:booking)
			@bookings = Booking.all
		else
			if not booking_params[:bed_id].blank?
				@bookings = Booking.by_bed(booking_params[:bed_id])
			elsif not search_params[:room_id].blank?
				@bookings = Booking.by_room(search_params[:room_id])
			elsif not search_params[:house_id].blank?
				@bookings = Booking.by_house(search_params[:house_id])
			elsif not search_params[:location_id].blank?
				@bookings = Booking.by_location(search_params[:location_id])
			else
				@bookings = Booking.all
			end

			if not booking_params[:guest_id].blank?
				@bookings = @bookings.by_guest(booking_params[:guest_id])
			end

			if (not booking_params[:start_date].blank?) && booking_params[:end_date].blank?
				@bookings = @bookings.by_start_date(booking_params[:start_date])
			end

			if (not booking_params[:end_date].blank?) && booking_params[:start_date].blank?
				@bookings = @bookings.by_end_date(booking_params[:end_date])
			end

			if (not booking_params[:end_date].blank?) && (not booking_params[:start_date].blank?)
				@bookings = @bookings.between_dates(booking_params[:start_date], booking_params[:end_date])
			end

		end
		@bookings = @bookings.order(start_date: :desc)
		@bookings = Kaminari.paginate_array(@bookings).page params[:page]
		@changes_count = ChangeLog.type("Participant").reviewed(false).count
	end

	def new
		@booking = Booking.new()
		@booking.guest_id = params[:guest_id] if params[:guest_id].present?
	end

	def create
		@booking = Booking.new(booking_params)
		@booking.participants << Participant.find(params[:participant_id]) if params.has_key?(:participant_id)
    @booking.save
    if not @booking.errors.empty?
    	respond_with(@booking)
    else
    	params.has_key?(:back_url) ? redirect_to(params[:back_url]) : redirect_to(bookings_path)
    end
	end

	def update
		@booking = Booking.find(params[:id])
		@booking.update(booking_params)
		if not @booking.errors.empty?
    	respond_with(@booking)
    else
    	redirect_to booking_payments_path(@booking)
    end
	end

	def next_deposit_state
		@booking = Booking.find(params[:id])
		@booking.next_deposit_state
		@booking.save!
		redirect_to booking_payments_path(@booking)
	end
	
  private

    def booking_params
      params.require(:booking).permit(:start_date, :end_date, :bed_id, :guest_id, :amount, :deposit_amount)
    end

    def search_params
    	params.permit(:location_id, :house_id, :room_id)
    end

    def add_locations
    	@locations = Location.includes( houses: [ rooms: [:beds] ] )
			gon.jbuilder "app/views/locations/index.json.jbuilder", as: "locations"
    end
    
    def check_profiles
    	if current_user.eventer? && !current_user.hoster?
  			return redirect_to events_path
  		elsif
  			current_user.doctor? || current_user.viewer?
  			return redirect_to guests_path
  		elsif !current_user.admin? || !current_user.hoster?
  			sign_out current_user
  			return redirect_to new_session_path(User.new)
  		end
    end
    
    def check_location_profile_update
    	@booking = Booking.find(params[:id])
    	unless (@booking.bed.room.house.location.name == 'Ashram' and current_user.hoster_ashram?) || (@booking.bed.room.house.location.name == 'Morada' and current_user.hoster_morada?)
    	  flash[:notice] = "No tiene permisos para realizar esta acción"
    	  return redirect_to(:back)
    	end
    end
    
    def check_location_profile_create
    	@booking = Booking.new(booking_params)
    	unless (@booking.bed.room.house.location.name == 'Ashram' and current_user.hoster_ashram?) || (@booking.bed.room.house.location.name == 'Morada' and current_user.hoster_morada?)
    	  flash[:notice] = "No tiene permisos para realizar esta acción"
    	  return redirect_to(:back)
    	end
    end
end