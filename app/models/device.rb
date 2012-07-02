class Device < ActiveRecord::Base
  attr_accessible :device_id, :device_type
  has_many :rentals
end
