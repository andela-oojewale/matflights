class Flight < ActiveRecord::Base
  has_many :bookings
  has_many :passengers, through: :bookings
  belongs_to :from, class_name: "Airport"
  belongs_to :to, class_name: "Airport"
end
