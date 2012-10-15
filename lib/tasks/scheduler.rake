desc "This task is called by the Heroku scheduler add-on"
task :email_reminders => :environment do
  puts "Emailing reminders"
  Rental.emailRenters
  puts "done."
end
