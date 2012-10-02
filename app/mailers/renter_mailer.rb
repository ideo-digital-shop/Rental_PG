class RenterMailer < ActionMailer::Base
  default from: "from@example.com"
  def reminderEmail(rental)
  	@rental = rental
  	@url = 'rentsys.herokuapp.com'
  	mail(:to => rental.email, :subject => "Welcome to My Awesome Site")
  end
end
