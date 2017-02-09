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
					total_beds = location.historicals.where("name = ? AND start_date <= ?", 'total_beds', start_date).order(start_date: :desc).limit(1).first.value
					bookings = Booking.between_dates(start_date, start_date.end_of_month).joins(bed: [room: [house: [:location]]]).where("locations.id = ? AND houses.open_stay = FALSE", location.id)
					beds_occupied = Booking.between_dates(start_date, start_date.end_of_month).joins(bed: [room: [house: [:location]]]).select("COUNT(DISTINCT beds.id) AS beds_occupied").where("locations.id = ? AND houses.open_stay = FALSE", location.id).take.beds_occupied
					total_days_occupied = 0
					bookings.each do |booking|
						booking.start_date = start_date if booking.start_date < start_date
						booking.end_date = start_date.end_of_month if booking.end_date > start_date.end_of_month
						total_days_occupied += (booking.end_date - booking.start_date).to_i
					end
					bookings_year << {days_occupied: total_days_occupied, beds_occupied: "#{beds_occupied}/#{total_beds}", occupancy_rate: '%g' % ('%.1f' % (total_days_occupied / (start_date.end_of_month.day * total_beds) * 100))}
					start_date = start_date + 1.month
				end
				@locations_bookings << {name: location.name, bookings_year: bookings_year}
			end
			@date_for_months = Date.new(date_params[:year].to_i, 1, 1)
			respond_to do |format|
				format.xlsx {
					response.headers['Content-Disposition'] = "attachment; filename=\"Occupancy of Beds #{@date_for_months.strftime('%Y')}.xlsx\""
				}
				format.html
			end
		end
		
		private
		
				def date_params
					params.require(:date).permit(:year)
				end
end