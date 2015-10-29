class BookingsController < ApplicationController
  before_filter :verify_login

  include Commons

  def index
    booking = Booking.new
    @bookings = booking.get_all_bookings(session[:user_id])
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
      if booking.save
        @confirmation_code = booking_params[:confirmation_code]
        @passengers_list = booking_params[:passengers_attributes]
        info = JSON.generate({
            name: session[:name],
            email: session[:email],
            flight_id: booking_params[:flight_id]
        })
        # PostmanWorker.perform_async(info,2)
        render "show"
      else
        redirect_to book_path, notice: "Booking failed. Please try again."
      end
  end

  def edit
  end

  def update
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
            passengers_attributes:
                                [:name,
                                 :email,
                                 :_destroy
                                ] )
    end

end