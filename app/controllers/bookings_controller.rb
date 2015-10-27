class BookingsController < ApplicationController
  before_filter :verify_login

  def index

  end

  def new
    @booking = Booking.new
    num_of_passenger = params[:pass]
    num_of_passenger.to_i.times do
      @booking.passengers.new
    end
    booking_info
    # require "pry"; binding.pry
  end

  def create
    @booking = Booking.new(booking_params)
      if @booking# .save

        info = JSON.generate({
            name: session[:name],
            email: session[:email],
            flight_id: booking_params[:flight_id]
        })
        # PostmanWorker.perform_async(info,5)
        render "show"
      else
        redirect_to log_path, notice: "Booking failed. Please try again."
      end
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
    params.require(:booking).permit(:no_of_passengers, :flight_id, :airline, passengers_attributes: [:name, :email, :_destroy])
  end

  def booking_info
    session[:no_of_passengers] = params[:pass]
    session[:dept] = params[:dept]
    session[:dest] = params[:dest]
    session[:flight_time] = params[:flight_datetime]
    session[:airline] = params[:airline]
  end


end