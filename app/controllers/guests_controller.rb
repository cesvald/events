class GuestsController < ApplicationController
	
	inherit_resources
	
	has_scope :by_name
	has_scope :by_surname
	has_scope :by_email

	respond_to :html, :json

	def index
		@guests = params[:q] ? Guest.where("name ILIKE :query OR surname ILIKE :query OR email ILIKE :query OR concat_ws(' ', name, surname) ILIKE :query", {query: "%#{params[:q]}%"}).page(params[:page]) : apply_scopes(Guest).page(params[:page])
		respond_to do |format|
			format.html
			format.json  {render :json => @guests.map(&:attributes)}
		end
	end

	def create
		@guest = Guest.new(guest_params)
    @guest.save
    redirect_to guests_path
	end

  private

    def guest_params
      params.require(:guest).permit(:name, :surname, :email)
    end
end