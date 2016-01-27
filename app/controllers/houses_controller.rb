class HousesController < ApplicationController

  inherit_resources
	actions :index, :create, :update, :destroy
	respond_to :html, :json

	def index
		@houses = params[:location_id] ? House.where(location: params[:location_id]) : House.all
	end

  private

    def house_params
      params.require(:house).permit(:name, :location_id)
    end
end