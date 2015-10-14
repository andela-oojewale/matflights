class Passenger < ActiveRecord::Base
  belongs_to :flight
end
