class Booking < ActiveRecord::Base
  has_many :passengers
  belongs_to :flight
end
