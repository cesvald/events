class BookingsController < BaseHostingController
	
	respond_to :html, :json
	
	before_action :add_locations
	before_action :check_profiles
	
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

		@bookings = Kaminari.paginate_array(@bookings).page params[:page]

	end

	def new
		@booking = Booking.new
	end

	def create
		@booking = Booking.new(booking_params)
    @booking.save
    if not @booking.errors.empty?
    	respond_with(@booking)
    else
    	redirect_to bookings_path
    end
	end

	def update
		@booking = Booking.find(params[:id])
		@booking.update(booking_params)
		if not @booking.errors.empty?
    	respond_with(@booking)
    else
    	redirect_to bookings_path
    end
	end

  private

    def booking_params
      params.require(:booking).permit(:start_date, :end_date, :bed_id, :guest_id)
    end

    def search_params
    	params.permit(:location_id, :house_id, :room_id)
    end

    def add_locations
    	@locations = Location.includes( houses: [ rooms: [:beds] ] )
			gon.jbuilder "app/views/locations/index.json.jbuilder", as: "locations"
    end
    
    def check_profiles
    	if not current_user.hoster?
    		if current_user.eventer?
    			return redirect_to events_path
    		else
    			sign_out current_user
    		end
    	end
    end
end