class Rental < ActiveRecord::Base
  validates :email, :uniqueness => { :case_sensitive => false }
  attr_accessible :device_id, :email, :end, :renter
  belongs_to :device
  def self.emailRenters
    for renter in self.where("'end' < ?", Date.current())
      RenterMailer.reminderEmail(renter).deliver
    end
  end
end
