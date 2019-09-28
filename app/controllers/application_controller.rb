class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  
  protect_from_forgery with: :exception
  before_action :authenticate_user
    
  helper_method :namespace, :to_currency
  
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to new_session_path(User.new), :alert => "No estás autorizado para realizar esa accción"
  end
  
  def namespace
    names = self.class.to_s.split('::')
    return "null" if names.length < 2
    names[0..(names.length-2)].map(&:downcase).join('_')
  end
  
  def to_currency (amount)
    ActionController::Base.helpers.number_to_currency amount, unit: 'USD', precision: 2, delimiter: '.'
  end
  
  protected

  def authenticate_user
  	respond_to do |format|
	  	format.html { redirect_to new_session_path(User.new) if !user_signed_in? }
	  	format.json { render json: {success: false, message: "Por favor inicia sesión"} if !user_signed_in? }
	  	format.xlsx
	  end
  end
  
end
