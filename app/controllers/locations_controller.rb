class LocationsController < ApplicationController

	inherit_resources
  actions :index, :create, :update, :destroy, :show, :new
  respond_to :html, :json

  private

    def location_params
      params.require(:location).permit(:name)
    end
end

