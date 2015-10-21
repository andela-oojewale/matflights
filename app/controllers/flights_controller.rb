class FlightsController < ApplicationController

  def index
    @flights_list = Flight.new.get_all_flights.paginate(:page => params[:page], :per_page => 20)
  end

  def show

  end

  def loggedin

  end

  def search_flight
    to = flight_params[:to_id]
    from = flight_params[:from_id]
    dept_time  =  flight_params[:dept_time]
    valid_airports(from, to)
    search = Flight.new.get_flight(to, from , dept_time)
    flash[:notice] = "No flights found. Please make another search." if search.empty?
    # flash[:notice] = search if !search.nil?
    redirect_to root_url
  end

  def create

  end

  protected

  def flight_params
      params.require(:flight).permit(:from_id, :to_id, :dept_time)
  end

  def  valid_airports(from, to)
    if to.to_i == from.to_i
      flash[:notice] = "Departure and Destination airports can not be the same."
    elsif to.empty? || from.empty?
      flash[:notice] = "Select your departure and destination airports."
    end
  end

end