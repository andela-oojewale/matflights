class BookingsController < ApplicationController
  before_filter :verify_login

  include Commons

  def index
    @booking = Booking.new
    bookings = @booking.get_all_bookings(session[:user_id], session[:provider], session[:email])

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
      if booking #.save
        @confirmation_code = booking_params[:confirmation_code]
        @passengers_list = booking_params[:passengers_attributes]
        # require "pry"; binding.pry
        info = JSON.generate({
            name: session[:name],
            email: session[:email],
            flight_id: booking_params[:flight_id]
        })
        # PostmanWorker.perform_async(info,2)
        render "show"
      else
        redirect_to log_path, notice: "Booking failed. Please try again."
      end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  protected

  def verify_login
    if !current_user
      flash[:notice] = "You have to login before you proceed."
      redirect_to root_path :notice
    end
  end

  def booking_params
    params.require(:booking).permit(:no_of_passengers, :flight_id, :confirmation_code, passengers_attributes: [:name, :email, :_destroy])
  end

end