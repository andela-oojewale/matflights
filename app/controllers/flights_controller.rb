class FlightsController < ApplicationController

  include Commons

  def index
    @flights_list =
    Flight.new.get_all_flights.
    paginate( :page => params[:page],
              :per_page => 20
              )
  end

  def look_up_search(message, to, from, dept_time)
    @flights_list = Flight.new.search_flight(to, from , dept_time)
    if @flights_list.kind_of? String
     flash[:notice] = @flights_list
     redirect_to root_url
    else
     return show_search
    end
  end

  def search
    to = flight_params[:to_id]
    from = flight_params[:from_id]
    dept_time  =  flight_params[:dept_time]
    message = Flight.new.valid_airports(from, to)
    if message.nil?
      look_up_search(message, to, from, dept_time)
    else
      flash[:notice] = message
      redirect_to root_url
    end
  end

  protected

  def flight_params
      params.require(:flight).permit(:from_id, :to_id, :dept_time, :ret_time)
  end

end