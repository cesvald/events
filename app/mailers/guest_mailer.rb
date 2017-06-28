class GuestMailer < ActionMailer::Base
  require 'mail'
  address = Mail::Address.new 'escuelavaloresdivinos@iniciadossky.com' # ex: "john@example.com"
  address.display_name = 'Escuela Valores Divinos'   # ex: "John Doe"
  
  # Set the From or Reply-To header to the following:
  default from: address.format
  
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.guest_mailer.welcome.subject
  #
  def suscription(guest, auth_token)
    @auth_token = auth_token
    @guest = guest
    
    attachments['Responsabilidad Personal_GENERAL_Julio 2017.pdf'] = File.read('private/Responsabilidad Personal_GENERAL_Julio 2017.pdf')
        
    m = mail({
      to: guest.email,
      subject: "Información Previa Actividades Julio",
      reply_to: "eventos@evdsky.com"
    }) do |format|
      format.html { render layout: 'email' }
    end
    
  end
  
end