class BookingMailer < ApplicationMailer
  def booking_details(user)
    @user = user
    @url = "http://matflights.herokuapp.com/book"
    mail( to: @user.email, subject: "Your Booking Details")
  end
end