class BookingsController < ApplicationController
  before_filter :verify_login

  attr_reader :booking

  def new
    @booking = Booking.new
    num_of_passenger = params[:pass]
    num_of_passenger.to_i.times do
      @booking.passengers.new
    end
  end

  def create
    @booking = Booking.new(booking_params)
      if @booking.save
        flash[:notice] = "Your booking has been successfully saved."
      else
        redirect_to log_path, notice: "Booking failed. Please try again."
      end

    # Code for mailer
    # BookingMailer.booking_details(@user).deliver_now
    # format.html { redirect_to(@user, notice: "Booking has been successfully made.") }

  end

  def show

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
    params.require(:booking).permit(:no_of_passengers, :flight_id, passengers_attributes: [:name, :email, :_destroy])
  end
end