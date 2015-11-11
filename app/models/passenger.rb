class Passenger < ActiveRecord::Base
  belongs_to :booking
  has_one :flight, through: :booking

  validates :name, presence: true
  validates :email, presence: true

  def passenger_info(booking_params)
    Passenger.where(booking_id: booking_params[:id]).destroy_all
    passengers_hash = booking_params[:passengers_attributes]
    pass_count = 0
    passengers_hash.each do | key, info_set |
      info_set.delete("_destroy")
      info_set["booking_id"] = booking_params[:id]
      return false if !Passenger.create(info_set).valid?
      pass_count += 1
    end
    Booking.new.reset_passengers(pass_count, booking_params[:id])
  end

end