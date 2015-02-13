class Device < ActiveRecord::Base
  validates :device_id, :uniqueness => true
  #attr_accessible :device_id, :device_type, :additional_information
  validates_presence_of :device_id, :device_type
  has_one :rental
  scope :rented, -> { includes(:rental).where.not(:rentals => {:id => nil}) }
end
