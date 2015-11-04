module BookingsHelper

  def update_saved(booking_params)
    @passengers_list = booking_params[:passengers_attributes]
    if Passenger.new.passenger_info(booking_params) != false
      message = "Update successful."
    else
      message = "Update failed."
    end
  end

  def booking_params
    params.require(:booking).
    permit( :no_of_passengers,
            :flight_id,
            :confirmation_code,
            :customer_id,
            :id,
            passengers_attributes:
                                [:name,
                                 :email,
                                 :_destroy
                                ] )
  end

  def flight_reseter(column, id, num)
    booking = Booking.new
    booking_info = booking.get_all_bookings(column, id)
    {
      code: booking_info[0]["flight_code"],
      dest: booking_info[0]["destination"],
      dept: booking_info[0]["departure"],
      cost: booking_info[0]["cost"],
      airline: booking_info[0]["airline"],
      flight_datetime: booking_info[0]["dept_date"],
      pass: num,
      booking_id: booking_info[0]["id"]
    }
  end

  def change_no_of_pass(passenger_num, id)
    booking = Booking.new
    num = params[:pass_num]
    id = params[:id]
    if booking.reset_passengers(num ,id)
      flash[:notice] = "Change has been made, please enter passenger(s) information."
      url_query = flight_reseter("b.id", id, num)
      redirect_to book_path(url_query)
    elsif !booking.reset_passengers(num ,id) && params[:id].nil?
      flash[:notice] = "Could not update number of passengers, contact the admin."
    end
  end

  def send_an_email(update, info)
    if update
      PostmanWorker.new.modify(info,2)
    else
      PostmanWorker.new.perform(info,2)
    end
  end

  def mail_worker(booking_params, name, email, update = true)
    @confirmation_code = booking_params[:confirmation_code]
    @passengers_list = booking_params[:passengers_attributes]
    info = JSON.generate({
        name: name,
        email: email,
        flight_id: booking_params[:flight_id]
    })
    send_an_email(update, info)
    render "show"
  end

  def save_booking(booking_params, booking, name, email)
    if booking.save
      mail_worker(booking_params, name, email, false)
    else
      redirect_to book_path, notice: "Booking failed. Please try again."
    end
  end

end