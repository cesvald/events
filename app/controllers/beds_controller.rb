class BedsController < InheritedResources::Base

	def index
		if (not params[:start_date].blank?) && (not params[:end_date].blank?)
			@beds = Bed.available(params[:start_date], params[:end_date])
		else
			if ((not params[:start_date].blank?) && (params[:end_date].blank?) || (params[:start_date].blank?) && (not params[:end_date].blank?))
				flash.now[:failure] = 'Start date and End date are both mandatory'
			end
			@beds = Bed.all
		end
	end

  private

    def bed_params
      params.require(:bed).permit(:number, :room_id)
    end
end