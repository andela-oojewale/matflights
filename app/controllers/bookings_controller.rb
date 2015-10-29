class BookingsController < ApplicationController
  before_filter :verify_login

  include Commons

  def index
    booking = Booking.new
    @bookings = booking.get_all_bookings("customer_id", session[:user_id])
    @no_record = true if @bookings.empty?
    render :index
  end

  def new
    @booking = Booking.new
    num_of_passenger = params[:pass]
    num_of_passenger.to_i.times do
      @booking.passengers.new
    end
    booking_info
  end

  def create
    booking = Booking.new(booking_params)
    @booking = BookingPresenter.new(booking)

    @booking_id = booking_params[:id]
    if @booking_id == nil || ""
      if booking.save
        @confirmation_code = booking_params[:confirmation_code]
        @passengers_list = booking_params[:passengers_attributes]
        info = JSON.generate({
            name: session[:name],
            email: session[:email],
            flight_id: booking_params[:flight_id]
        })
        PostmanWorker.perform_async(info,2)
        render "show"
      else
        redirect_to book_path, notice: "Booking failed. Please try again."
      end
    else
      update
    end
  end

  def edit
  end

  def update
    if !@booking_id.nil?
      @booking = Booking.find(@booking_id)
      if @booking.update(booking_params)
        @booking.save
        flash[:notice] = "Update successful."
      else
        flash[:notice] = "Update failed."
      end
      render :update
    else
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
  end

  def destroy
    booking = Booking.new
    booking_id = params[:id]
    rows = booking.delete_record(booking_id)
    if rows > 0
      flash[:notice] = "#{rows} booking cancelled successfully."
    else
      flash[:notice] = "Unable to cancel the booking, please contact the admin."
    end
    redirect_to my_bookings_path
  end

  def get_reservation
    booking = Booking.new
    code = params[:ref]
    booking_details = booking.get_confirmation(code)
    if booking_details.nil?
      flash[:notice] = "Invalid confirmation code"
      render :edit
    else
      no_of_passenger = booking_details[:no_of_passengers]
      booking_id = booking_details[:id]
      redirect_to update_path(pass: no_of_passenger, id: booking_id)
    end
  end

  protected

  def verify_login
    if !current_user
      flash[:notice] = "You have to login before you proceed."
      redirect_to root_path :notice
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

end