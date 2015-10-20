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
    search = Flight.new.get_flight(to, from , dept_time)
    unless search.empty?

    end
      # require "pry"; binding.pry
    redirect_to root_url, notice: search
  end

  def create

  end

  protected

  def flight_params
      params.require(:flight).permit(:from_id, :to_id, :dept_time)
  end

end