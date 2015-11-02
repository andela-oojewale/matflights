class UpdateMailer < ApplicationMailer

  def update_details(name, email, flight_id)
    @name = name
    @flight_id = flight_id
    @email = email
    if @email
      mail( to: @email, subject: "You Have Updated Your Booking Details")
    else
      mail( to: "olaide.ojewale@andela.com", subject: "You Have Updated Your Booking Details.")
    end
  end

end