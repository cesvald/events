class LocationsController < ApplicationController

	inherit_resources
  actions :index, :create, :update, :destroy, :show, :new
  respond_to :html, :json

  def calendar
		@locations = Location.includes(houses: [ rooms: [ :beds ] ]).all
		date_params[:year] = Time.now.year if date_params[:year].blank?
		date_params[:month] = Time.now.month if date_params[:month].blank?

		@start_date = Date.new(date_params[:year].to_i, date_params[:month].to_i, 1)
		@end_date = Date.new(date_params[:year].to_i, date_params[:month].to_i, -1)
	end

  private

    def location_params
      params.require(:location).permit(:name)
    end

    def date_params
    	params.require(:date).permit(:year, :month)
    end
end

