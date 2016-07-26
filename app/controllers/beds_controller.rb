class BedsController < InheritedResources::Base

	def index
		@locations = Location.includes( houses: [ rooms: [:beds] ] )
		gon.jbuilder "app/views/locations/index.json.jbuilder", as: "locations"

		if (not params[:start_date].blank?) && (not params[:end_date].blank?)
			@beds = Bed.includes(room: [ house: [ :location ] ]).available(params[:start_date], params[:end_date]).order("locations.id, houses.id, rooms.id, beds.id")
			if not search_params[:room_id].blank?
				@beds = @beds.by_room(search_params[:room_id])
			elsif not search_params[:house_id].blank?
				@beds = @beds.by_house(search_params[:house_id])
			elsif not search_params[:location_id].blank?
				@beds = @beds.by_location(search_params[:location_id])
			end
			@beds = Kaminari.paginate_array(@beds).page params[:page]
		else
			if ((not params[:start_date].blank?) && (params[:end_date].blank?) || (params[:start_date].blank?) && (not params[:end_date].blank?))
				flash.now[:failure] = 'Start date and End date are both mandatory'
			end
			@beds = Bed.includes(room: [ house: [ :location ] ]).page(params[:page])
		end
	end
	
  private

    def bed_params
      params.require(:bed).permit(:number, :room_id)
    end

    def search_params
    	params.permit(:location_id, :house_id, :room_id)
    end
end