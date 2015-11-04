class Passenger < ActiveRecord::Base
  belongs_to :booking
  has_one :flight, through: :booking

  validates :name, presence: true
  validates :email, presence: true

  def passenger_info(booking_params)
    Passenger.where(booking_id: booking_params[:id]).destroy_all
    passengers_hash = booking_params[:passengers_attributes]
    passengers_hash.each do | key, info_set |
      pass_info = info_set
      pass_info["booking_id"] = booking_params[:id]
      return false if !Passenger.create(pass_info).valid?
    end
  end

end