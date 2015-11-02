class BookingsController < ApplicationController
  before_filter :verify_login

  include Commons
  include BookingsHelper

  def index
    booking = Booking.new
    @bookings = []
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
    if @booking_id == nil || @booking_id == ""
      save_booking(booking_params, booking, session[:name], session[:email])
    else
      update
    end
  end

  def edit
  end

  def update
    if !@booking_id.nil?
      booking = Booking.new(booking_params)
      @booking = BookingPresenter.new(booking)
      flash[:notice] = update_saved(booking_params)
      session.delete(:conf_code)
      mail_worker(booking_params, session[:name], session[:email])
    else
      change_no_of_pass(params[:pass_num], params[:id])
    end
  end

  def destroy
    booking = Booking.new
    booking_id = params[:id]
    rows = booking.delete_record(booking_id)
    if rows > 0
      flash[:notice] = "#{rows} booking cancelled successfully."
    else
      flash[:alert] = "Unable to cancel the booking, please contact the admin."
    end
    redirect_to dashboard_path
  end

  def get_reservation
    booking = Booking.new
    code = params[:ref]
    booking_details = booking.get_confirmation(code)
    if booking_details.nil?
      flash[:alert] = "Invalid confirmation code"
      render :edit
    else
      no_of_passenger = booking_details[:no_of_passengers]
      booking_id = booking_details[:id]
      session[:conf_code] = code
      redirect_to update_path(pass: no_of_passenger, id: booking_id)
    end
  end

  protected

  def verify_login
    if !current_user
      flash[:alert] = "You have to login before you proceed."
      session[:query] = params
      redirect_to root_path :notice
    end
  end

end