class BookingMailer < ApplicationMailer

  def booking_details(name, email, flight_id)
    @name = name
    @flight_id = flight_id
    @email = email
    if @email
      mail( to: @email, subject: "Your Booking Details")
    else
      mail( to: "olaide.ojewale@andela.com", subject: "Your Booking Details")
    end
  end

end