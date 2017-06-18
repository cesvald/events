class SpacesController < InheritedResources::Base

  private

    def space_params
      params.require(:space).permit(:event_id, :place_id, :amount)
    end
end

