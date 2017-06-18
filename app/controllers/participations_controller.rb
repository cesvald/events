class ParticipationsController < InheritedResources::Base

  private

    def participation_params
      params.require(:participation).permit(:space_id, :modality_id, :amount)
    end
end

