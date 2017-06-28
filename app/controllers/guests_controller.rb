class GuestsController < ApplicationController
	
	inherit_resources
	
	has_scope :by_name
	has_scope :by_surname
	has_scope :by_email

	respond_to :html, :json
	
	after_filter :set_comming_from, only: :edit
	
	skip_before_filter :authenticate_user, only: [:auto_edit, :update, :not_access_allowed, :auto_update_success]
	before_filter :authenticate_token, only: [:auto_edit]
	
	def index
		@guests = params[:q] ? Guest.where("name ILIKE :query OR surname ILIKE :query OR email ILIKE :query OR concat_ws(' ', name, surname) ILIKE :query", {query: "%#{params[:q]}%"}).page(params[:page]) : apply_scopes(Guest).page(params[:page])
		respond_to do |format|
			format.html
			format.json  {render :json => @guests.map(&:attributes)}
		end
	end

	def edit
		@back_url = URI(request.referer || root_path).path
		edit!
	end
	
	def update
		update! do |success|
			success.html {
				flash[:notice] = "Contacto actualizado exitosamente" if current_user
				redirect_to session[:previous_url]
			}
		end
	end
	
	def auto_edit
		session[:profile] = "eventer"
		session[:previous_url] = auto_update_success_guests_path()
	end
	
	def auto_update_success
		
	end
	
	def not_access_allowed
	
	end
	
	
	def create
		@guest = Guest.new(guest_params)
    @guest.save
    redirect_to guests_path
	end

  private

    def guest_params
      params.require(:guest).permit(:name, :surname, :email, :country, :city, :phone_number, :mobile_number, :identification, :civil_status, :profession, :nationality, :health_condition, :receive_drug, :symptoms, :contact_name, :contact_kin, :contact_number, :hotel, :local_number, :comments, :is_initiate, :age)
    end
    
    def set_comming_from
    	session[:previous_url] = URI(request.referer || '').path
    end
    
		def authenticate_token
			tokenControl = TokenControl.where(auth_token: params[:auth_token], guest_id: params[:id]).first
			return redirect_to not_access_allowed_guests_path if tokenControl.nil?
			@guest = tokenControl.guest
		end 

end