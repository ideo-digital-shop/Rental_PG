class Rental < ActiveRecord::Base
  validates :email, :uniqueness => { :case_sensitive => false }
  validates :device_id, :uniqueness => true
  attr_accessible :device_id, :email, :end, :renter
  belongs_to :device
  def self.emailRenters
    for renter in self.all
    	if renter.end < Date.current()
     		RenterMailer.reminderEmail(renter).deliver
     	end
    end
  end
end
