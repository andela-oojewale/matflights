class FlightsController < ApplicationController

  include Commons

  def index
    @flights_list = Flight.new.get_all_flights.paginate(:page => params[:page], :per_page => 20)
  end

  def show
    to = flight_params[:to_id]
    from = flight_params[:from_id]
    dept_time  =  flight_params[:dept_time]
    if valid_airports(from, to).nil?
      @flights_list = Flight.new.search_flight(to, from , dept_time)
      if @flights_list.kind_of? String
       flash[:notice] = @flights_list
      else
        return show_search
      end
    end
    redirect_to root_url
  end

  def create

  end

  protected

  def flight_params
      params.require(:flight).permit(:from_id, :to_id, :dept_time)
  end

  def  valid_airports(from, to)
    if to.empty? || from.empty?
      flash[:notice] = "Select your departure and destination airports."
    elsif to == from
      flash[:notice] = "Departure and Destination airports can not be the same."
    end
  end

end