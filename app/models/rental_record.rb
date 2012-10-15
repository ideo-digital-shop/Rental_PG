class RentalRecord < ActiveRecord::Base
  attr_accessible :device_id, :email, :end, :renter, :total_time
end
