class Reports::BookingsController < ApplicationController
		inherit_resources
		skip_before_action :authenticate_user, only: :monthly_guests
		
		def monthly_guests
				date_params[:year] = Time.now.year if date_params[:year].blank?
			locations = Location.all
			@locations_bookings = []
				locations.each do |location|
						start_date = Date.new(date_params[:year].to_i, 1, 1)
					end_date = Date.new(date_params[:year].to_i, 12, -1)
					bookings_year = []
					while start_date < end_date do
							bookings_year << Booking.between_dates(start_date, start_date.end_of_month).joins(:guest, bed: [room: [house: [:location]]]).select("COUNT(DISTINCT guests.id) AS total_guests").where("locations.id = ?", location.id)
							start_date = start_date + 1.month
						end
						@locations_bookings << {name: location.name, bookings_year: bookings_year}
				end
				start_date = Date.new(date_params[:year].to_i, 1, 1)
			end_date = Date.new(date_params[:year].to_i, 12, -1)
			bookings_year = []
			while start_date < end_date do
					bookings_year << Booking.between_dates(start_date, start_date.end_of_month).joins(:guest, bed: [room: [house: [:location]]]).select("COUNT(DISTINCT guests.id) AS total_guests")
						start_date = start_date + 1.month
				end
			@locations_bookings << {name: "Total", bookings_year: bookings_year}
			@date_for_months = Date.new(date_params[:year].to_i, 1, 1)
			respond_to do |format|
				format.xlsx {
					response.headers['Content-Disposition'] = "attachment; filename='Monthly Guests #{@date_for_months.strftime('%Y')}.xlsx'"
				}
				format.html
			end
		end
		
		private
		
				def date_params
					params.require(:date).permit(:year)
				end
end