class Rental < ActiveRecord::Base
  validates :device_id, :uniqueness => true
  validates_associated :device
  validates_presence_of :device_id, :email, :end, :renter, :device
  attr_accessible :device_id, :email, :end, :renter, :comment
  belongs_to :device
  def self.emailRenters
    for renter in self.all
    	if renter.end < Date.current()
     		RenterMailer.reminderEmail(renter).deliver
     	end
    end
  end
end
