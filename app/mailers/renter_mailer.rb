class RenterMailer < ActionMailer::Base

  default from: "noreply@ideo.com"
  def reminderEmail(rental)
  	@rental = rental
  	@url = 'rentsys.herokuapp.com'
  	mail(:to => rental.email, :subject => "Digital Shop iPad Rental Confirmation")
  end
end
