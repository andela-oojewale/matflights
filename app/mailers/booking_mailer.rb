class BookingMailer < ApplicationMailer
  def booking_details(user, flight_id)
    @user = user
    @flight_id = flight_id
    if @user.email
      mail( to: @user.email, subject: "Your Booking Details")
    else
      mail( to: "olaide.ojewale@andela.com", subject: "Your Booking Details")
    end
  end
end