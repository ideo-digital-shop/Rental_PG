class Rental < ActiveRecord::Base
  validates :device_id, :uniqueness => true
  validates_associated :device
  validates_presence_of :device_id, :email, :end, :renter, :device
  belongs_to :device
  after_initialize :defaults

  def self.emailRenters
    for renter in self.all
    	if renter.end < Date.current()
     		RenterMailer.reminderEmail(renter).deliver
     	end
    end
  end

  def defaults
    # Default rental to one week from now
    self.end = DateTime.now.to_date + 7
  end
end
