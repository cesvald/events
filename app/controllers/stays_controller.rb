class StaysController < InheritedResources::Base

  private

    def stay_params
      params.require(:stay).permit(:participant_id, :space_id, :start_at, :end_at)
    end
end

