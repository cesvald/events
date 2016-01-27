class BookingsController < ApplicationController
	inherit_resources
	respond_to :html, :json

	def index
		@bookings = Booking.all
	end

	def new
		@booking = Booking.new
		@locations = Location.includes( houses: [ rooms: [:beds] ] )
		gon.jbuilder "app/views/locations/index.json.jbuilder", as: "locations"
    respond_with(@profile)
	end

  private

    def booking_params
      params.require(:booking).permit(:start_date, :end_date, :bed_id, :host_id, :bed_id)
    end
end