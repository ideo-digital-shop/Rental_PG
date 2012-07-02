class Rental < ActiveRecord::Base
  attr_accessible :device_id, :email, :end, :renter
  belongs_to :device
end
