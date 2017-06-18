class AirTicketsController < InheritedResources::Base

  private

    def air_ticket_params
      params.require(:air_ticket).permit(:participant_id, :arrive_at, :arrive_to, :leave_at, :leave_from, :estimated_at)
    end
end

