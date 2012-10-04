class Device < ActiveRecord::Base
  validates :device_id, :uniqueness => true
  attr_accessible :device_id, :device_type
  validates_presence_of :device_id, :device_type
  has_one :rental
end
