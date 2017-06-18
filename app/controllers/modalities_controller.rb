class ModalitiesController < InheritedResources::Base

  private

    def modality_params
      params.require(:modality).permit(:name, :event_id)
    end
end

